# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Load tab completions, this path is for Fedora
if [ -f /etc/profile.d/bash_completion.sh ] ; then
	. /etc/profile.d/bash_completion.sh
fi

# This is OSX, with bash-completion installed via brew. You need a newer
# version of bash than the OS default (which is 3.2), and completions to match.
# https://kubernetes.io/docs/tasks/tools/install-kubectl/#enabling-shell-autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash" ]] && . "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"

#If you'd like to use existing homebrew v1 completions, add the following before the first sourcing line:
#export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
