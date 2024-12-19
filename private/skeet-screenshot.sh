SCREENSHOT_DIR="/home/ocbwoy3/Pictures/Screenshots"


# file to upload

LATEST_FILE=$(ls -t "$SCREENSHOT_DIR" | head -n 1)
FILE_PATH="$SCREENSHOT_DIR/$LATEST_FILE"

notify-send -t 2000 -u low -i "$FILE_PATH" "OCbwoy3's Dotfiles" "This is your last screenshot, skeet it?"

CHOICE="$(echo "no
yes" | wofi --show dmenu --prompt "Skeet last screenshot?")"

if [ $CHOICE == "yes" ]; then
    notify-send -t 2000 -u low "OCbwoy3's Dotfiles" "Attempting to skeet it!"
    bun run ~/Projects/OCbwoy3-Util/src/skeet-this-banger/index.ts ""
else
    notify-send -t 2000 -u low "OCbwoy3's Dotfiles" "Cancelled lol"
fi