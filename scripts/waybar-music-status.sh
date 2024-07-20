#!/bin/bash

SONG="$(playerctl metadata title -s)"

if [ ${#SONG} -gt 1 ] ; then
    printf "$(playerctl metadata artist) — $SONG" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g"
else
    printf ""
fi
