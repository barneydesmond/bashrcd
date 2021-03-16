#!/usr/bin/env bash

# This is called... when???
# Apparently "executed by the command interpreter for login shells."
logger -t "$USER" "Starting ~/.profile for ${TERM}"
echo "Starting ~/.profile for ${TERM}"


# This is a thin wrapper for setting up our shell,
# which all happens in .bashrc and friends.
if [ -f ~/.bashrc ]; then . ~/.bashrc ; fi

logger -t bdesmond1 "Finished ~/.profile for ${TERM}"
echo "Finished ~/.profile for ${TERM}"
