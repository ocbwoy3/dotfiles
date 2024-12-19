#!/usr/bin/env bash

# config

SCREENSHOT_DIR="/home/ocbwoy3/Pictures/Screenshots"
R2_BUCKET_NAME="dotfiles-upload-private"

# file to upload

LATEST_FILE=$(ls -t "$SCREENSHOT_DIR" | head -n 1)
FILE_PATH="$SCREENSHOT_DIR/$LATEST_FILE"

# filename 

BORDERED_FILE="/tmp/bordered_$LATEST_FILE"

convert "$FILE_PATH" -bordercolor "#cba6f7" -border 6x6 "$BORDERED_FILE" > /dev/null

TIMESTAMP=$(date +%s)
SHA256SUM=$(sha256sum "$BORDERED_FILE" | awk '{ print $1 }')
UPLOAD_NAME="${SHA256SUM:0:6}-${TIMESTAMP: -4}.png"

# the real deal

notify-send "OCbwoy3's Dotfiles" "Uploading last screenshot to R2"

wrangler r2 object put "$R2_BUCKET_NAME/$UPLOAD_NAME" --file "$BORDERED_FILE"
rm $BORDERED_FILE

# Check if the upload succeeded
if [ $? -eq 0 ]; then
    echo "File uploaded successfully: $UPLOAD_NAME"
    echo "https://i.darktru.win/$UPLOAD_NAME" | wl-copy -n
    notify-send "OCbwoy3's Dotfiles" "URL has been copied to clipboard."
else
    notify-send "OCbwoy3's Dotfiles" "File failed to upload, WTF?"
    echo "File upload failed."
fi
