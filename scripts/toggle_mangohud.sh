#!/bin/bash
config_file=~/.config/MangoHud/MangoHud.conf
no_disp=$(grep -i 'no_display=' "$config_file" | awk '{ print $3 }')

if grep -q "no_display=0" "$config_file"; then
    sed -i 's/no_display=0/no_display=1/' "$config_file"
    notify-send -t 1000 -u low "OCbwoy3's Dotfiles" "MangoHud disabled"
elif grep -q "no_display=1" "$config_file"; then
    sed -i 's/no_display=1/no_display=0/' "$config_file"
    notify-send -t 1000 -u low "OCbwoy3's Dotfiles" "MangoHud enabled"
else
    notify-send -u low "OCbwoy3's Dotfiles" "no_display not found in config"
fi
