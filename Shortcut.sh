ShortDic=/home/zaki/Scripts/DicShort
ShortFil=/home/zaki/Scripts/shortFil
ShortCut=/home/zaki/Scripts/Shorts

tmp=$(mktemp)
sed -e '/#/d' -e '/^$/d' $ShortDic > $tmp

awk '{print "alias "$1 "=\""  $2 "\"" }' $tmp > $ShortCut

#sed  '/#/d' $ShortFil > $tmp
#awk '{print "alias "$1 "=\"" "cd " $2 "\"" }' $tmp > ~/Conf/Config/shortFil 


rm $tmp
