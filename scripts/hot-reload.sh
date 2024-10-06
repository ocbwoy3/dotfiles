#!/bin/bash

kill -9 $(pidof waybar)

hyprctl dispatch exec "waybar -c ~/dotfiles/waybar/config -s ~/dotfiles/waybar/style.css" &
hyprctl reload
