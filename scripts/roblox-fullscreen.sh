# run roblox in fullscreen with mouse sensitivity of the os default and not some value set by roblox

WAYBAR_PID=$(pidof -s waybar)

if [ ${#WAYBAR_PID} -gt 0 ]; then

    kill -9 $(pidof waybar)

    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword general:border_size 0
    hyprctl keyword decoration:rounding 0

    notify-send -t 5000 -u critical "OCbwoy3's Dotfiles" "Enabled \"Fake Fullscreen\" for Roblox"

else

    hyprctl reload

    hyprctl dispatch exec bash $HOME/dotfiles/scripts/hot-reload.sh

    notify-send -t 5000 -u critical "OCbwoy3's Dotfiles" "Disabled \"Fake Fullscreen\" for Roblox"

fi