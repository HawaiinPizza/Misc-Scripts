tmp=$(mktemp)
PrayerTime=~/.local/share/Prayer/PrayerData

# See if prayertime is there. if not, craete
if [  ! -f $PrayerTime ];then
	lynx -dump https://www.muslimpro.com/Prayer-times-in-Dearborn-MI-United-States-4990510 > $PrayerTime
	sed '1,29d' $PrayerTime > $tmp
	sed '32,1000d' $tmp > $PrayerTime
fi

# Check if month is current
Month=$(cat $PrayerTime | sed '1!d'  | date --date="$(awk '{print $3 " " $2}')" +%m )

if [ $Month -eq  $(date +%m) ]; then

	for i in $(atq -q p | cut -f 1); do atrm $i; done
	Date="$(date +'%d' )"
	Line=$(cat $PrayerTime | sed $Date!d )
	Faj=$(echo $Line | awk '{print $4}')
	Dhur=$(echo $Line | awk '{print $6}')
	Asr=$(echo $Line | awk '{print $7}')
	Mag=$(echo $Line | awk '{print $8}')
	Ish=$(echo $Line | awk '{print $9}')


	notify-send -u 'critical' 'Prayer Time' "$Faj $Dhur $Asr $Mag $Ish "  



	echo " notify-send -u 'critical' 'Prayer Time' 'Prayer Faj '"  |  at -q p $Faj  today 
	echo " notify-send -u 'critical' 'Prayer Time' 'Prayer Dhur'"  | at -q p $Dhur today 
	echo " notify-send -u 'critical' 'Prayer Time' 'Prayer Asr '"  |  at -q p $Asr today 
	echo " notify-send -u 'critical' 'Prayer Time' 'Prayer Mag '"  |  at -q p $Mag today 
	echo " notify-send -u 'critical' 'Prayer Time' 'Prayer Ish '"  |  at -q p $Ish today 


else
	echo wow
fi
	

