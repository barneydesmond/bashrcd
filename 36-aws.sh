# Provides the `ec2` script
if [ -d ~/git/aws ] ; then
	export PATH=~/git/aws:$PATH
else
	echo -n "(no action) "
fi
