tmp=$(mktemp)

calcurse -a > $tmp
notify-send -u 'low' 'Schedule for today' " $(cat $tmp | sed '1,1d')  "

TimePrayer.sh



