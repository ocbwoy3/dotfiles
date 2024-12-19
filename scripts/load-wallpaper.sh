#!/bin/bash

WALLPAPER=$(cat $HOME/.cache/.wallpaper)

rm -r ~/.cache/wal

# wal -stn -a 90 -i $HOME/wallpaper/$WALLPAPER

swww img $HOME/wallpaper/$WALLPAPER --transition-fps 120 --transition-duration 2 -t wipe &
bash ~/dotfiles/scripts/hot-reload.sh
