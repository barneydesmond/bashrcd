bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
orange=$(tput setaf 3)
darkblue=$(tput setaf 4)
purple=$(tput setaf 5)
aqua=$(tput setaf 6)
white=$(tput setaf 7)
mediumblue=$(tput setaf 12)
reset=$(tput sgr0)

export THIS_IS_GARBAGE_TO_SATISFY_THE_SYNTAX_CHECKER="${bold}${red}${green}${orange}${darkblue}${purple}${aqua}${white}${mediumblue}${reset}"

PS1="\[${green}\]\u@\h\[${reset}\] \[${mediumblue}\]\w\[${reset}\]\$ "

# are we an interactive shell?
if [ "$PS1" ]; then
    case $TERM in
    xterm*|putty*|screen)
        function _update_ps1() {
           PS1="$(~/git/powerline-shell/powerline-shell.py $? 2> /dev/null)"
        }

        if [ "$TERM" != "linux" ]; then
            if python -c 'import argparse' 2>/dev/null ; then
                PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
            else
                echo -n "no argparse, no powerline-shell :( "
            fi
        fi

        echo -n "You're on ${TERM}, "
        ;;
    *)
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
fi

