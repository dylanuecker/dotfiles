#!/bin/bash

source /home/dylan/.config/polybar/toggle-functions.sh

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
