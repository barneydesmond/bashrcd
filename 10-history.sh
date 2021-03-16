# Timestamps in shell history
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# Disable the use of ! for history expansion (so you can echo bangs in strings easily)
set +o histexpand
