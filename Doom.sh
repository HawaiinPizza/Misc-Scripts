List="Vannila\nBrutal\nProject"
Choice="$(printf $List  | dmenu -i -p  "Pick the doom game")"

case $Choice in
	Vannila)
	 	gzdoom  & disown
		;;
	Brutal)
	 	gzdoom /home/zaki/Games/Doom/brutalv21.pk3 & disown
		;;
	Project)
		gzdoom "/home/zaki/Games/Doom/.ProjectBrutal/Project Brutality 2.03.pk3" & disown
		;;
	*)
esac

