#!/bin/bash

killall waybar
killall hyprpaper

hyprpaper &
waybar -c ~/dotfiles/waybar/config -s ~/dotfiles/waybar/style.css &