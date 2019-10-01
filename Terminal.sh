Term=$( printf "st\nuxterm\ntermite\ncool-retro-term\nurxvt\nkitty\ntilix\nsakura\nhyper\n"  | dmenu -p "What terminal you want?" ) 
Temp=$(command -v $Term)
if [ -z $Temp ]; then
	echo Not a terminal
else
	$Term >/dev/null 2>&1 & disown
fi



