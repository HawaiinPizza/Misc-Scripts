Search="$(printf "😂" | dmenu -p "What is your search?")"
if [ ! -z "$Search" ]; then
	surfraw duckduckgo -browser=firefox $Search
fi
