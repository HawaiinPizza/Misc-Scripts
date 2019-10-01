Dir(){
	if [ ! -z "$2" ]; then
		cd "$( dirname $( locate Ass | fzy) )"
	else
		$2 "$( dirname $( locate Ass | fzy) )"
	fi
}

Edit(){
	if [ ! -z "$2" ]; then
		Name=" $( locate Ass | fzy) "
		cd "$( dirname $Name )"
		vim $Name
	else
		Name=" $( locate Ass | fzy) "
		cd "$( dirname $Name )"
		$2 $Name
	fi
}


case $1 in
	-d)
		Dir  $2
		;;
	-w)
		Edit $2
		;;
	*)
		;;
esac

