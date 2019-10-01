List="emacs\natom\nsubl3\ngeany\ncode"
Choice=$(printf $List | dmenu -p "Get which text editor?")

if [ ! -z $Choice ]; then
	$Choice & disown
fi
