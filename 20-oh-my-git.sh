if tty -s ; then
	if [ -f ~/git/oh-my-git/prompt.sh ] ; then
		source ~/git/oh-my-git/prompt.sh
	else
		echo -n "Oh My Git is not installed, "
	fi
fi
