#!/bin/bash

function _processTitle {
	sed -r ""
	# wip this shit	
	# sed -r "s/(?!(.*(Eurobeat).*))(\(feat\. .*\)$| \- Friday Night Funkin'?:?.*$|(.*(Remix|Edited).*)$| \(.*Funkin.*\)$)/"
}

SONG="$(playerctl metadata title -s)"

if [ ${#SONG} -gt 0 ] ; then
	BRUH1=$( echo "  $(playerctl metadata artist | sed -r "s/( \& Minecraft$)//") — $(playerctl metadata title -s)" | _processTitle | sed -r "s/(^[ ]*)|([ ]*$)//g" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	BRUH2=$( echo "$(playerctl metadata album)" | sed -r 's/\&/\&amp;/g' | sed -r 's/\"/\&quot;/g' | sed -r "s/'/\&apos;/g" )
	printf "{\"text\": \"$BRUH1\", \"tooltip\": \"$BRUH2\", \"class\":\"music\" }"
else
	printf "{\"text\": \"\", \"tooltip\": \" \", \"class\":\"invisible\" }"
fi
