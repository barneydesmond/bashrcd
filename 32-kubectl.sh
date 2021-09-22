if hash kubectl 2>/dev/null ; then
	source <(kubectl completion bash)
fi

# One of the annoying things about kubectl is that it rewrites the entire
# config file when you switch contexts, which is sucks if you don't like its
# yaml formatting, and it removes your comments and whitespacing. Petty but
# legitimate annoyance.
#
# One sort-of solution to this, that incidentally makes your config more
# flexible, is to split it into a series of files, and use the KUBECONFIG
# envvar to glue them all together. I'm stealing the idea from this page:
# https://www.starkandwayne.com/blog/silly-kubectl-trick-7-merge-all-the-kubeconfigs/
#
# The ideal(?) for a working team would be to put the cluster configs in a repo
# or something, then you inject your own user tokens locally. When certs get
# updated forever, you get the update for free via the shared repo.
#
# * ~/.kube/config is the default config, so leave that in place. kubectl will
#   rewrite the first file to put current-context in it, so we might as well
#   let it be that one.
# * Put shared frags in a directory somewhere, we'll use ~/.kube/shared_config
#   for now but the assumption is you can point it to a repo dir later.
# * Put NON-shared stuff somewhere else, like your user definitions. This
#   contains sensitive material like your auth token, so don't commit that to a
#   repo that might not be private.
SHARED_KUBECONFIG_DIR=~/.kube/shared_config
KUBE_AUTHTOKENS=~/.kube/authtokens.yml

if [ -d $SHARED_KUBECONFIG_DIR ] ; then
	if [ -f $KUBE_AUTHTOKENS ] ; then
		# Don't think too hard about this line...
		KUBECONFIG=$(python -c 'import sys;print(":".join(sys.argv[1:]))' ~/.kube/config $SHARED_KUBECONFIG_DIR/* ~/.kube/authtokens.yml)
	else
		KUBECONFIG=$(python -c 'import sys;print(":".join(sys.argv[1:]))' ~/.kube/config $SHARED_KUBECONFIG_DIR/*)
	fi
	export KUBECONFIG
fi
