if [ -d ~/git/dec-tools/bin ] ; then
	export PATH=~/git/dec-tools/bin:$PATH
fi

if [ -d ~/bin ] ; then
	export PATH=~/bin:$PATH
fi

if [ -d ~/.local/bin ] ; then
	export PATH=~/.local/bin:$PATH
fi

# OSX python binaries
if [ -d ~/Library/Python/2.7/bin ] ; then
	export PATH=~/Library/Python/2.7/bin:$PATH
fi
