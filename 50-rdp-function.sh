function rdp() {
	local getwinpass
	local verifywin
	local theusername
	local thepassword
	local resolution
	resolution="1200x760"

	if [[ "$1" == "-0" ]]
	then
		console="$1"
		shift
	else
		console=""
	fi

	getwinpass=`ssh root@bulkhead cat passwords | egrep "$1[[:space:]]+anchor[[:space:]]+" | tr -s "\t" " " | tr -s " " | cut --delimiter=" " --fields=3`
	if [[ "$getwinpass" == "" ]]
	then
		verifywin=`ssh root@bulkhead cat passwords | egrep "$1[[:space:]]+(A|a)dministrator[[:space:]]+" | tr -s "\t" " " | tr -s " " | cut --delimiter=" " --fields=3`
		if [[ "$verifywin" == "" ]]
		then
			echo "$1 is not a server, dumbass."
		else
			echo "No anchor login present (FIX THIS!), using Administrator"
			theusername="administrator"
			thepassword=$verifywin
		fi
	else
		theusername="anchor"
		thepassword=$getwinpass
	fi

	mkdir -m 0700 -p /tmp/rdesktop-files
	echo "File sharing available between /tmp/rdesktop-files and $1 at \\\\\\\\tsclient\\\\anchor"
	rdesktop $console $1 -g $resolution -a 16 -r disk:anchor=/tmp/rdesktop-files -u $theusername -p - << EOF
$thepassword
EOF
}
