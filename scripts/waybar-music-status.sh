#!/bin/bash

SONG="$(playerctl metadata title -s)"

if [ ${#SONG} -gt 1 ] ; then
	BRUH1=$( echo "  $(playerctl metadata artist) — $SONG" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	BRUH2=$( echo "$(playerctl metadata album)" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	printf "{\"text\": \"$BRUH1\", \"tooltip\": \"$BRUH2\" }"
else
	printf "{\"text\": \"lol\", \"tooltip\": \" \" }"
fi
