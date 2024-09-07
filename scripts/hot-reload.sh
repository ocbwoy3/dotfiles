#!/bin/bash

kill -9 $(pidof waybar)

waybar -c ~/dotfiles/waybar/config -s ~/dotfiles/waybar/style.css &