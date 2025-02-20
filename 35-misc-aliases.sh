case $(uname -s) in
	Darwin)
		alias ls='ls -lhG'
		;;
	Linux|*)
		alias ls='ls -lh --color'
		;;
esac

alias key='openssl rsa -text -noout -in'
alias req='openssl req -text -noout -in'
alias cert='openssl x509 -text -noout -in'

alias pwl='pwgen'
alias pws='openssl rand -base64 16 | tr -cd a-hjkp-zA-HJKP-Z2-9 | cut -c 1-16'

alias gno='gnome-open'

alias fs='find . -path "*/.git" -prune -o -type f -print'
alias fsg='find . -type f'
alias ds='find . -path "*/.git" -prune -o -type d -print'
alias dsg='find . -type d'

# Put display rotation back to normal landscape
alias normx='xrandr --output DP-3 --transform 1.0000,0.0000,0,0.0000,1.0000,0,0,0,1'

# This is apparently a pretty common one for people that use kubectl all day
alias k='kubectl'

# It sure would be handy if `ps` showed useful process starttimes for stuff that's a bit older
alias psstart='ps axfo user,pid,%cpu,%mem,vsz,rss,tname,stat,lstart:25,time:10,args'

# This is a temporary workaround for me to access the test cluster while rancher is down.
# I'm reusing the `k` alias as a convenience, normal people just alias it to
# kubectl but I never remember to use that anyway.
alias k="kubectl --kubeconfig ~/.kube/onefile_config_sy4-testkube.yml --context=sy4-testkube-sy4-testkube3"
