alias mem='cd ~/git/mm/projects/sysadmin/dutty/ ; git pull'
alias dns='cd ~/git/mm/projects/sysadmin/ansible/infra/dnsmasq ; git pull'
alias ans='cd ~/git/fpga-infra/ansible/'
alias ks='cd ~/git/fpga-infra/k8s/'

# Different `ans` location on some servers
if [[ "$HOSTNAME" == "us185."* ]] ; then
	alias ans='cd ~/git/ardc-config/AroraConfig/'
fi


# This is for the benefit of our ansible repo, it runs ansible-playbook via a
# docker container instead of a locally installed version. Which is a really
# cool idea, but it doesn't work on my workstation. So I'll just stick with the
# local ansible package, it's fine.
export USE_DOCKER=0

# For quiet ansible output
alias ansible-quiet="export ANSIBLE_DISPLAY_OK_HOSTS=false ; export ANSIBLE_DISPLAY_SKIPPED_HOSTS=false ; echo You will now have very quiet ansible runs, only changes and failures will be ; echo reported. This will persist until you close the terminal or run ansible-loud"

# For back to normal ansible output
alias ansible-loud="unset ANSIBLE_DISPLAY_OK_HOSTS ; unset ANSIBLE_DISPLAY_SKIPPED_HOSTS ; echo Back to normal ansible output now."


# Slurm tools
alias squeue='squeue -o "%9i %35j %12P %4C %7m %9u %11T %9M %16R %10p %E"'

# The py.test executable on current Debian is called py.test-3
if hash py.test-3 2>/dev/null ; then
	hash py.test 2>/dev/null || alias py.test='py.test-3'
fi

# Internal pastebin http://pb/
# /usr/bin/some_cmd | pb
alias pb='curl -F c=@- pb'
