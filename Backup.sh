# Figure out a way to organically get hte t
date=/var/cache/Backup/date
Dot="$HOME/.config/:$HOME/.local/bin/:$HOME/Notes:$HOME/Projects:$HOME/.BothAlias.sh:$HOME/.BothAlias.sh:$HOME/.BothFunctions.sh:$HOME/.Bothrc.sh:$HOME/.bashrc:$HOME/.dwm/:$HOME/.tmux.conf:$HOME/.tmux/:$HOME/.vim/:$HOME/.viminfo:$HOME/.vimrc:$HOME/.zshrc"

#Pass="$HOME/.password
Media="$HOME/Music"
source $date

# date --date="$Var" +%s
#Last=$(date --date="$LastBackup" +%s)
Now=$(date  +%s)
Next=$(date --date="$NextBackup" +%s)


# Actually backuping up.
alias config='/usr/bin/git --git-dir=/home/zaki/.DotFiles/ --work-tree=/home/zaki'


if [ $Now -gt $Next ] || [ "$1" == "-f" ]
then

	for i in ${Dot//:/ }
	do
		config add $i 
	done
	config commit -m  "Backup for $(date)"
	config push
	pass git push
	LastBackup=$(date +%Y-%m-%d)
	NextBackup=$(date -d "+2 days" +%Y-%m-%d)
	notify-send "Backup  Done" "Finsihed backup"
else
	notify-send "Backup Not Needed" "Master I have nothing to do"
fi



printf "LastBackup=$LastBackup\nNextBackup=$NextBackup\nBackupFreq=$BackupFreq\n " > $date
