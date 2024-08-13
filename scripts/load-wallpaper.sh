#!/bin/bash

WALLPAPER=$(cat $HOME/.cache/.wallpaper)

rm -r ~/.cache/wal

wal -stn -a 90 -i $HOME/wallpaper/$WALLPAPER

swww img $HOME/wallpaper/$WALLPAPER --transition-fps 300 --transition-duration 2 &
bash ~/dotfiles/scripts/hot-reload.sh
