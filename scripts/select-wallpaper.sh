#!/bin/bash

WALLPAPER=$(ls $HOME/wallpaper/ | wofi --show dmenu)

if [ ${#WALLPAPER} -gt 0 ] ; then

	rm -f $HOME/.cache/.wallpaper

	echo "$WALLPAPER" >> $HOME/.cache/.wallpaper

	rm -rf $HOME/.cache/wal

	# notify-send -t 2000 -u low -h int:value:50 "OCbwoy3's Dotfiles" "Calculating color scheme"

	# wal -stn -a 90 -i $HOME/wallpaper/$WALLPAPER

	notify-send -t 2000 -u low "OCbwoy3's Dotfiles" "Setting wallpaper"

	swww img $HOME/wallpaper/$WALLPAPER --transition-fps 300 --transition-duration 2 &
bash ~/dotfiles/scripts/hot-reload.sh

else
	printf "not changing wallpaper\n"
fi
