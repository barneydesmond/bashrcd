# Upload a file to my website
function img () {
	local imgpath=$1
	local imgname=$(basename "$imgpath")
	if [ ! -f "$imgpath" ] ; then
		echo "$imgpath does not exist"
		return 1
	fi
	rsync -v -4 "$imgpath" furinkan@shimako:~/public_html/img/
	echo "http://furinkan.meidokon.net/img/${imgname}"
}

function trv () {
	local imgpath=$1
	if [ ! -f "$imgpath" ] ; then
		echo "$imgpath does not exist"
		return 1
	fi
	# Activate my personal config
	sed -r -i 's#^access_key = .*#access_key = PMCD3CF0Y59200LXUVKC#' ~/.s3cfg
	sed -r -i 's#^secret_key = .*#secret_key = dGEOIVBW/asUN0DEedXE5SRzuwidnAw7a+k9+GAT#' ~/.s3cfg
	s3cmd put -P "$imgpath" s3://j_furinkan_meidokon_net
	sleep 5
	# Revert anchor account
	sed -r -i 's#^access_key = .*#access_key = 193RK4EI5YFX35Q83790#' ~/.s3cfg
	sed -r -i 's#^secret_key = .*#secret_key = F+FlFDikAybSzLzADoCbMo3+v2kSrlz8biZ63wZa#' ~/.s3cfg
}
