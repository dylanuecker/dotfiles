#!/bin/sh

if [ $1 = 'up' ]; then
	brightnessctl set --min-value=12010 10+%
elif [ $1 = 'down' ]; then
	brightnessctl set --min-value=12010 10-%
fi

brightness=$(brightnessctl | awk '/Current/ { print $4 }' | tr -d "()")
notify-send "Brightness $brightness" \
	-t 1500 -h string:x-canonical-private-synchronous:brightness-notification \
	-h int:value:$brightness
