Options="suspend\npoweroff\nhibernate\nreboot"

if [ "$1" == "-x" ]; then
	Choice=$(printf "$Options" | dmenu -p "What would you like to do? ")
else
	Choice=$(printf "$Options" | pmenu -p "What would you like to do? ")
fi

if [ -z $Choice ]
then
	echo No command given
else
	# Do operations that are important before systemctl shutoff
	pulsemixer --mute
	notify-send -u 'critical' "calcurse notification header" "$(calcurse -n)"
	pkill transmission-daemon

	systemctl $Choice
	mpc pause
	xmodmap ~/.Xmodmap
fi

