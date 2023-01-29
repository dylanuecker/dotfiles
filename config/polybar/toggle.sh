#!/bin/bash

show() {
	polybar-msg cmd show 
	bspc config top_padding 21
	#bspc config gapless_monocle false
}

hide () {
	polybar-msg cmd hide 
	bspc config top_padding 0 
	#bspc config gapless_monocle true
}

ws=$(bspc query -D -d focused --names)

# there has to a better logical solution to this, but
# just want to get working and be done with it
if [ "$1" = "No touchie." ]; then
	if [ -f /tmp/polybarhidden$ws ]; then 
		hide
	else 
		show
	fi
else
	if [ -f /tmp/polybarhidden$ws ]; then 
		show
		rm /tmp/polybarhidden$ws 
	else 
		hide
		touch /tmp/polybarhidden$ws
	fi
fi
