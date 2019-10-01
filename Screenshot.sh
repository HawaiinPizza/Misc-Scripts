WindowScreen(){
	 scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'
}
FullScreen(){
	scrot /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'
}

case $1 in
	-w)
		WindowScreen
		;;
	-f)
		FullScreen
		;;
	*)
		;;
esac
	
