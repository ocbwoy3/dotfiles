#!/bin/bash

kill -9 $(pidof waybar)

hyprctl dispatch exec "GTK_THEME=Adwaita waybar -c ~/dotfiles/waybar/config -s ~/dotfiles/waybar/style.css" &
hyprctl reload

ROBLOX_PID="$(pidof sober)"

echo ${#ROBLOX_PID}

if [ ${#ROBLOX_PID} -lt 1 ]; then
	rm ~/.regretevator_state
fi
