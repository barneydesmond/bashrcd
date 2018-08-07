# This is the default
#export WORKON_HOME=$HOME/.virtualenvs

# This applies when you run mkproject
export PROJECT_HOME=$HOME/git

# Do give me the systemwide stuff plz, not everything is available via pip
# (eg. dateutils)
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--system-site-packages'

if [ -f /usr/bin/virtualenvwrapper.sh ] ; then
	. /usr/bin/virtualenvwrapper.sh
fi
