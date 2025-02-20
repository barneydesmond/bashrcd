# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Search the PATH Again if the hashed command no longer exists
shopt -s checkhash

# Load tab completions, this path is for Fedora
if [ -f /etc/profile.d/bash_completion.sh ] ; then
	. /etc/profile.d/bash_completion.sh
fi

# This is OSX, with bash-completion installed via brew. You need a newer
# version of bash than the OS default (which is 3.2), and completions to match.
# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#enable-shell-autocompletion
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash" ]] && . "/Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash"
