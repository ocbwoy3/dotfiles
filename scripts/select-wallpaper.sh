#!/bin/bash

WALLPAPER=$(ls $HOME/wallpaper/ | wofi --show dmenu)

if [ ${#WALLPAPER} -lt 1] ; then
	exit
fi

rm $HOME/.cache/.wallpaper

echo "$WALLPAPER" >> $HOME/.cache/.wallpaper

rm -r $HOME/.cache/wal

wal -stn -a 90 -i $HOME/wallpaper/$WALLPAPER

swww img $HOME/wallpaper/$WALLPAPER --transition-step 120 --transition-fps 120 --transition-type grow --transition-pos top-right --transition-duration 1.5 &
bash ~/dotfiles/scripts/hot-reload.sh
