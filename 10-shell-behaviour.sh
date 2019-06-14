# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Load tab completions, this path is for Fedora
if [ -f /etc/profile.d/bash_completion.sh ] ; then
	. /etc/profile.d/bash_completion.sh
fi

# This is OSX, with bash-completion installed via brew
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash" ]] && . "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
