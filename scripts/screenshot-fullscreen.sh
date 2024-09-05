# Change according to your locale. $HOME/Pictures/Screenshots

DIR="$HOME/Pictures/Screenshots/"
NAME="$(date +%d%m%Y_%H%M%S).png"

monitor="$(hyprctl monitors | awk '/Monitor/{monitor=$2} /focused: yes/{print monitor; exit}')"
grim -o "$monitor" "$DIR$NAME"
wl-copy < $DIR$NAME &
notify-send "Screenshot" "Saved and copied to clipboard."
swappy -f "$DIR$NAME"
