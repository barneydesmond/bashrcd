export GOPATH=$HOME/go
if hash go 2>/dev/null ; then
	export PATH=$PATH:$(go env GOPATH)/bin
fi
