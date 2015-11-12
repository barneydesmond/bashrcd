# .bash_profile

# This is called for putty/ssh sessions
logger -t bdesmond1 "Starting bash_profile for ${TERM}"
echo "Starting bash_profile for ${TERM}"

# This is a thin wrapper for setting up our shell,
# which all happens in .bashrc and friends.
if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi

logger -t bdesmond1 "Finished bash_profile for ${TERM}"
echo "Finished bash_profile for ${TERM}"
