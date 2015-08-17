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
    export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    case $TERM in
    xterm*)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD}\007"'
        echo -n "You're on xterm "
        ;;
    screen)
        PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
        ;;
    *)
        ;;
    esac
    # Turn on checkwinsize
    shopt -s checkwinsize
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
    # You might want to have e.g. tty in prompt (e.g. more virtual machines)
    # and console windows
    # If you want to do so, just add e.g.
    # if [ "$PS1" ]; then
    #   PS1="[\u@\h:\l \W]\\$ "
    # fi
    # to your custom modification shell script in /etc/profile.d/ directory
fi

