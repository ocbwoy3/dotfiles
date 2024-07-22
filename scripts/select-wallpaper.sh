#!/bin/bash

WALLPAPER=$(ls $HOME/wallpaper/ | wofi --show dmenu)

echo "$WALLPAPER" >> $HOME/.cache/.wallpaper

rm -r ~/.cache/wal
wal -stn -a 90 -i $HOME/wallpaper/$WALLPAPER
swww img $HOME/wallpaper/$WALLPAPER --transition-step 120 --transition-fps 120 --transition-type grow --transition-pos top-right --transition-duration 1.5 &
bash ~/dotfiles/scripts/hot-reload.sh
