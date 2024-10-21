# Change according to your locale. $HOME/Pictures/Screenshots

DIR="$HOME/Pictures/Screenshots/"
NAME="$(date +%d%m%Y_%H%M%S).png"

SELECTION="$(slurp -w 0 -d)"

if [ ${#SELECTION} -gt 0 ]; then

	grim -g "$SELECTION" "$DIR$NAME"
	wl-copy < $DIR$NAME
	notify-send "Screenshot" "Saved and copied to clipboard."
	swappy -f "$DIR$NAME"

fi
