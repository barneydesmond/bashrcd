alias mem='cd ~/git/mm/projects/sysadmin/dutty/ ; git pull'

# Slurm tools
alias squeue='squeue -o "%9i %35j %12P %4C %7m %9u %11T %9M %16R %10p %E"'

# The py.test executable on current Debian is called py.test-3
if hash py.test-3 2>/dev/null ; then
	hash py.test 2>/dev/null || alias py.test='py.test-3'
fi
