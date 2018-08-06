#!/bin/bash
if /sbin/ip link list | egrep -q 'ether (00:50:56:22:33:44|00:0c:29:01:cb:a5|54:04:a6:3f:90:e5) ' ; then
	echo -n "DET workstation detected, enabling proxies, "
	export http_proxy=proxy.det.nsw.edu.au:80
	export https_proxy=proxy.det.nsw.edu.au:80
	export ftp_proxy=proxy.det.nsw.edu.au:80
fi
