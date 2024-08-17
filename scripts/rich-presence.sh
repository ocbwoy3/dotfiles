#!/bin/bash

process_check() {
    # vesktop.bin because discord doesnt work with this
    pidof vesktop.bin >/dev/null 2>&1
    return $?
}

while ! process_check; do
    sleep 1
done

echo discord found

sleep 5

cd "$HOME/dotfiles/scripts"

linux-discord-rich-presence -c ~/dotfiles/scripts/rich-presence.py