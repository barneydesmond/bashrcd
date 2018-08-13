# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Load tab completions, this path is for Fedora
if [ -f /etc/profile.d/bash_completion.sh ] ; then
	. /etc/profile.d/bash_completion.sh
fi
