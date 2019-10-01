#!/bin/bash
clear
<<Dab
Tmux there are three cases a session is

It's Attach
	Remove from group
It's Part of a group
	Is the group name=to it's name?
		Add to Attach list
It's not part of the group


Dab


tmp=$(mktemp)
tmux ls -F '#{session_name}  #{session_group} '   >> $tmp


List=$(mktemp)
sed -i '/Temp/d' $List
while read line
do

	Name="$(echo $line | awk '{print $1 }' )"
	Group="$(echo $line | awk '{print $2 }' )"

	if [ "$Group" == "$Name" ];then
		echo $Name >> $List
	elif [ -z "$Group" ]; then
		echo $Name >> $List
	fi
done < $tmp

cat $List | sort -r
Choice="$(cat $List  | sort -r | dmenu -p "Which tmux session to attach to?" )"

if [  ! -z "$Choice" ]; then
	if  grep -q $Choice $List ; then
		st -e tmux new-session -s $$Temp -D -t $Choice
	else
		st -e tmux new-session -s "$Choice "
	fi
fi

#printf "\n\n"

## Name
#awk '{print $1  }' $tmp
#printf "\n"

## Attach
#awk '{print $2  }' $tmp
#printf "\n"

## Session frmat
#awk '{print $3  }' $tmp
#printf "\n"

## Gropu
#awk '{print $4  }' $tmp
