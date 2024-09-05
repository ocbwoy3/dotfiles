#!/bin/bash

SONG="$(playerctl metadata title -s)"

if [ ${#SONG} -gt 0 ] ; then
	BRUH1=$( echo "  $(playerctl metadata artist | sed -r "s/( \& Minecraft$)//") — $(playerctl metadata title -s)" | sed -r "s/(\(.*Friday Night.*)|( (\-) Friday Night Funkin'?:? (.*)|\(feat\. (.*)\)| ?\((.*)(Funkin|Edited)(.*)\))$//g" | sed -r "s/\(?(!(Eurobeat))([a-zA-Z0-9]*? ?(R|r)emix|(E|e)dited ?[a-zA-Z0-9]*?|[a-zA-Z0-9]* ?(M|m)ix)\)?//" | sed -r "s/(^[ ]*)|([ ]*$)//g" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	BRUH2=$( echo "$(playerctl metadata album)" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	printf "{\"text\": \"$BRUH1\", \"tooltip\": \"$BRUH2\" }"
else
	printf "{\"text\": \" \", \"tooltip\": \" \" }"
fi
