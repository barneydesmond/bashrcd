alias sho='ssh -o StrictHostKeyChecking=no'
alias shop='ssh -o StrictHostKeyChecking=no -o PasswordAuthentication=yes -o PubkeyAuthentication=no'
alias sco='scp -o StrictHostKeyChecking=no'

# Very useful after rebooting a server and you're waiting to get back on it
alias sshreboot='ssh -o ConnectTimeout=1 -o ConnectionAttempts=999'

alias keymake='make -C ~/.ssh/'

alias clean_known_hosts='ssh-keygen -f ~/.ssh/known_hosts -R'
