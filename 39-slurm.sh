export BAMBOO_URL="http://build.syd.aristanetworks.com"

alias SLURM_NODES='sinfo -h -N -O nodehost | sort -u'
alias s_info='sinfo -N -O nodehost:11,available:7,statecomplete,nodeai:12,cpusstate:15,cpusload:10,memory:9,allocmem:10,freemem:10,disk:10,partition:14,preemptmode:7'
alias s_queue='squeue -o "%9i %35j %12P %4C %7m %9u %9T %11M %12R %17p %10E %20f %o"'

s_summary () {
    echo "PENDING: ($(squeue -t PENDING -h | wc -l))"
    squeue -t PENDING -h -o "%P/%j" | sed "s|^interactive/|_2_|; s|^bobs/sleep|_3_sleep|; s|^bobs/|_1_${BAMBOO_URL}/browse/|; s/TMNG-EXPLR-//" | sort | uniq -c | sed "s|_[[:digit:]]_||"
    echo
    echo "RUNNING: ($(squeue -t RUNNING -h | wc -l))"
    squeue -t RUNNING -h -o "%P/%j" | sed "s|^interactive/|_2_|; s|^bobs/sleep|_3_sleep|; s|^bobs/|_1_${BAMBOO_URL}/browse/|; s/TMNG-EXPLR-//" | sort | uniq -c | sed "s|_[[:digit:]]_||"
}

s_top () {
    if [ $# -ne 1 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <job_name>" \
            "Move all jobs with a job name that contains <job_name> to the top of the slurm queue." \
            "Example: ${FUNCNAME[0]} BS-123"
        return
    fi

    squeue -t PENDING -o "%9i %35j" | grep "${1}" | while read -r id name; do
        sudo scontrol top "${id}" && echo "Moved ${id}: ${name}" || echo "Failed to move ${id}: ${name}"
    done
}

s_cancel () {
    if [ $# -ne 1 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <job_name>" \
            "Cancel all jobs with a job name that contains <job_name>." \
            "Example: ${FUNCNAME[0]} BS-123"
        return
    fi

    for job_name in $(squeue -o "%35j"  | grep "${1}" ); do
        sudo scancel --name="${job_name}"
    done
}

s_down () {
    if [ $# -ne 2 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <node_name> <reason>" \
            "Down given slurm <node_name> for <reason>." \
            "Stops all running and suspended jobs and makes the node unavailable for new jobs." \
            "Example: ${FUNCNAME[0]} bob[1-2] \"SA-1234\""
        return
    fi

    local node_name=${1}
    local reason=${2}
    sudo scontrol update nodename="${node_name}" state=DOWN reason="${reason}"
}

s_drain () {
    if [ $# -ne 2 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <node_name> <reason>" \
            "Drain given slurm <node_name> for <reason>." \
            "Indicates that no new jobs may be started on this node. Existing jobs are allowed to run to completion, leaving the node in a DRAINED state once all the jobs have completed." \
            "Example: ${FUNCNAME[0]} bob[1-2] \"SA-1234\""
        return
    fi

    local node_name=${1}
    local reason=${2}
    sudo scontrol update nodename="${node_name}" state=DRAIN reason="${reason}"
}

s_resume () {
    if [ $# -ne 1 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <node_name>" \
            "Resume given slurm <node_name>." \
            "Example: ${FUNCNAME[0]} bob[1-2]"
        return
    fi

    local node_name=${1}
    sudo scontrol update nodename="${node_name}" state=RESUME
}

s_run () {
    if [ $# -eq 0 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <command>" \
            "Run <command> on all slurm nodes." \
            "Example: ${FUNCNAME[0]} ls"
        return
    fi

    local command
    local node_list

    command=$@
    node_list=$(sinfo --noheader -O nodehost | sort --version-sort)

    for node in ${node_list}; do
        ssh "${node}" ${command}
    done
}

s_debug () {
    local node_filter
    local node_list

    node_filter=${1:-drain}
    node_list=$(sinfo -h -N -O nodehost,statecomplete | grep ${node_filter} | sort -u | awk '{ print $1 }')

    for node in ${node_list}; do
        local node_state
        local node_slurmctld_log
        local node_slurmctld_log_timestamp
        local node_slurmd_log
        local slurm_job_ids
        local slurm_job_name
        local node_d_state_procs

        node_state=$(sinfo -h -N -O nodehost,statecomplete | grep "${node}" | uniq | awk '{ print $2 }')
        node_slurmctld_log=$(ssh slurm-prod-c1 'cat /var/log/slurm/slurmctld.log | grep '"${node}"' | grep update_node | tail -n 2')
        node_slurmctld_log_timestamp=$(echo "${node_slurmctld_log}" | awk '{ print $1 }' | sed 's/^\[\(.*\)\].*$/\1/')
        node_slurmd_log=$(ssh "${node}" 'cat /var/log/slurm/slurmd.log | grep -B5 -A5 "STEPD TERMINATED ON '"${node}"'" | tail -n 11')
        slurm_job_ids=$(echo "${node_slurmd_log}" | grep "STEPD TERMINATED ON ${node}" | sed 's/.*\[\([[:digit:]]\+\)\.[[:digit:]]\].*/\1/' | sed -z 's/\n/,/g;s/,$/\n/')
        slurm_job_name=$(sacct -j "${slurm_job_ids}" -o "JobID%20,JobName%35" | fgrep .0 | sed 's/\.0//' | awk '{print $2" ("$1")"}')
        node_d_state_procs=$(ssh "${node}" 'ps -eo stat,user,pid,pgid,sid,%cpu,%mem,vsz,rss,command | awk "NR==1 || \$1 == \"D\""')
        echo "${node}: ${node_state}"
        echo slurm-prod-c1:/var/log/slurm/slurmctld.log
        echo "${node_slurmctld_log}"
        printf "\n"
        echo "${node}:/var/log/slurm/slurmd.log"
        echo "${node_slurmd_log}"
        printf "\n"
        printf "%s\n" "Slurm jobs:" "${slurm_job_name}"
        printf "\n"
        printf "%s\n" "D state procs:" "${node_d_state_procs}"
        printf "\n\n"
    done
}

s_reboot () {
    if [ $# -eq 0 ]; then
        printf "%s\n" \
            "Usage: ${FUNCNAME[0]} <node_name>" \
            "Drain and reboot given slurm <node_name>." \
            "Example: ${FUNCNAME[0]} bob[1-2]"
        return
    fi

    local node_name
    local node_list

    node_name=${1}
    node_list=$(sinfo -h -O nodehost -n "${node_name}")
    for node in ${node_list}; do
        echo "ssh ${node} 'sudo -- /bin/bash -c \"/etc/tingle/hooks/pre-apply.d/10-wait-for-slurm-drain && touch /.slurm-resume-on-boot && reboot\"'" | at now
    done
}
