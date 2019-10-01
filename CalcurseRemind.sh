Hour=$(calcurse -n | sed -e '/next/d' -e 's/\[//' -e 's/\].*//' -e 's/\W*//' -e 's/:.*//')
Minute=$(calcurse -n | sed -e '/next/d' -e 's/\[//' -e 's/\].*//' -e 's/\W*//' -e 's/.*://')
Bat=$(acpi | awk '{print $4}' | sed 's/%.*//')

if [ ! $Hour -eq 0 ];
then
	Temp=$(($Hour*60))
	Minute=$(($Temp+$Minute))
fi

if [ $Minute -lt 15 ];
then
	#notify-send -u 'critical' "calcurse notification header" "$(calcurse -n)"
	echo "$(calcurse -n)" | dzen2 -p -bg '#FFFFFF' -fg '#FF0000' & disown

fi

if [ $Bat -lt 10 ]; then
	notify-send -u critical "COMPUTER IS OGING TO DIEEEEE"
	notify-send -u critical "Like right now"
	notify-send -u critical "DO something now"
fi
