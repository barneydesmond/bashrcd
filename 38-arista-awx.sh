export TOWER_HOST=https://awx.metamako.com/
export TOWER_USERNAME=$USER
export TOWER_PASSWORD=$MM_LDAP_PASSWORD
# You need to auth from the CLI, doesn't use any envvars directly.
#$(TOWER_USERNAME=$USER TOWER_PASSWORD=<yourldapPW> awx login -f human)
