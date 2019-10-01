Prayer=/home/zaki/.local/share/Prayer/PrayerData

Day=$(date +%d)
Line=$(cat $Prayer | sed "$Day!d" )
Faj=$(echo $Line | awk '{print $4}')
Dhur=$(echo $Line | awk '{print $6}')
Asr=$(echo $Line | awk '{print $7}')
Mag=$(echo $Line | awk '{print $8}')
Ish=$(echo $Line | awk '{print $9}')

notify-send -u 'low' "Prayer Times" "Fajir $Faj\nDhur $Dhur\nAsr $Asr\nMagrib $Mag\nIsha $Ish\n"

#printf "Fajir $Faj\nDhur $Dhur\nAsr $Asr\nMagrib $Mag\nIsha $Ish\n" | dzen2    -p 5



