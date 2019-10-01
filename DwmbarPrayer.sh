clear
PrayerTime=~/.local/share/Prayer/PrayerData

Time=$(date +"%H%M")
Date="$(date +'%d' )"
Line=$(cat $PrayerTime | sed $Date!d )
Faj=$(echo $Line | awk '{print $4}' | sed 's/://')
Dhur=$(echo $Line | awk '{print $6}'| sed 's/://')
Asr=$(echo $Line | awk '{print $7}' | sed 's/://')
Mag=$(echo $Line | awk '{print $8}' | sed 's/://')
Ish=$(echo $Line | awk '{print $9}' | sed 's/://')


Time=1590
printf "$Faj\t$Dhur\t$Asr\t$Mag\t$Ish\t$Time\n"
if	 [ "$Time" -lt "$Faj" ]; then
	echo Dhur $(($Dhur-$Time))
elif	[ "$Time" -lt "$Dhur" ]; then
	echo Dhur $(($Asr-$Time))
elif	[ "$Time" -lt "$Asr" ]; then
	echo Dhur $(($Mag-$Time))
elif	[ "$Time" -lt "$Mag" ]; then
	echo Dhur $(($Ish-$Time))
else
	echo Faj Tomorrow
fi

