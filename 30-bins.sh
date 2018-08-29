if [ -d ~/git/dec-tools/bin ] ; then
	export PATH=~/git/dec-tools/bin:$PATH
fi

if [ -d ~/bin ] ; then
	export PATH=~/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

# Tab-complete for vault
if hash vault 2>/dev/null ; then
	complete -C /home/bdesmond1/.local/bin/vault vault
fi
