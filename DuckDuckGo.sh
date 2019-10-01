
case $1 in
	-f)
		Browser="firefox"
		;;
	-q)
		Browser="qutebrowser"
		;;
	-s)
		Browser="surf"
		;;
	-v)
		Browser="vimb"
		;;
	*)
		Choice="qutebrowser\nvimb\nsurf\nfirefox"
		Browser="$(printf $Choice | dmenu -p "What browser do you want?")"
		;;
esac

if [ ! -z $Browser ]; then
	Search="$(printf "😂" | dmenu -p "What is your search?")"
	if [ ! -z "$Search" ]; then
		surfraw duckduckgo -browser=$Browser $Search
	fi
fi

