if /sbin/ip link list | grep -q '00:0c:29:01:cb:a5' ; then
	echo -n "DET workstation detected, enabling proxies, "
	export http_proxy=proxy.det.nsw.edu.au:80
	export https_proxy=proxy.det.nsw.edu.au:80
	export ftp_proxy=proxy.det.nsw.edu.au:80
fi
