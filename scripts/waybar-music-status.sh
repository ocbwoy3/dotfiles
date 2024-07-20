#!/bin/bash

SONG="$(playerctl metadata title -s)"

if [ ${#SONG} -gt 1 ] ; then
    echo "$(playerctl metadata artist) — $SONG"
else
    echo ""
fi
