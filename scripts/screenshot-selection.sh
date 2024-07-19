# Change according to your locale. $HOME/Pictures/Screenshots

DIR="$HOME/Pictures/Screenshots/"
NAME="$(date +%d%m%Y_%H%M%S).png"

grim -g "$(slurp)" "$DIR$NAME"
xclip -selection clipboard -t image/png -i "$DIR$NAME"
notify-send "Screenshot" "Saved and copied to clipboard."
swappy -f "$DIR$NAME"
