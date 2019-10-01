WorkHosts=/etc/WHosts
PlayHosts=/etc/PHosts
host=/etc/hosts
tmp=$(mktemp)

Work() {

	pass Squareroot | sudo -S cp $WorkHosts  $host
	pass Squareroot | sudo -S chmod -x /usr/bin/gzdoom /usr/bin/qutebrowser
	if [ "$1" == '-x' ]; then
		echo "Time for school ZAKI you got a minute to stop your bullshit" | dzen2 -p 1 & disown
		snore 30
	fi
	
	pkill qutebrowser
	pkill gzdoom

}

Play() {
	pass Squareroot | sudo -S  cp $PlayHosts  $host
	pass Squareroot | sudo -S chmod +x /usr/bin/gzdoom /usr/bin/qutebrowser
	if [ "$1" == '-x' ]; then
		echo "Time for fun :)" | dzen2 -p 1 & disown
	fi
}

case $1 in
	p)
		Play
		;;
	w)
		Work
		;;
	px)
		Play -x
		;;
	wx)
		Work -x
		;;
	*)
		echo not a valid command
		;;
esac
