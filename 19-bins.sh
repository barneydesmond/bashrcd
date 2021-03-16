# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# OSX python binaries
if [ -d ~/Library/Python/2.7/bin ] ; then
	export PATH=~/Library/Python/2.7/bin:$PATH
fi
