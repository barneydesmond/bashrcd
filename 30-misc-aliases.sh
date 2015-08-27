alias ls='ls -lh --color'

alias key='openssl rsa -text -noout -in'
alias req='openssl req -text -noout -in'
alias cert='openssl x509 -text -noout -in'

alias pwl='pwgen'
alias pws='openssl rand -base64 16 | tr -cd a-hjkp-zA-HJKP-Z2-9 | cut -c 1-10'

alias go='gnome-open'

alias wgetapi='wget --user="$API_AUTH_USER" --password="$API_AUTH_PASS" -S'

alias fs='find . -path "*/.git" -prune -o -type f -print'
alias fsg='find . -type f'
alias ds='find . -path "*/.git" -prune -o -type d -print'
alias dsg='find . -type d'

# Uses the virtualenvwrapper
alias ve='workon everything'

alias cleanmarquise='cd ~/git/ && rm -rf libmarquise && git clone barneydesmond.github.com:anchor/libmarquise.git && cd libmarquise/ && echo -e "Now run:\n    autoreconf -if\n    ./configure"'
