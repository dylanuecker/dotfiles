#!/bin/sh

if [ $1 = 'up' ]; then
	wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+
elif [ $1 = 'down' ]; then
	wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%-
elif [ $1 = 'togglemute' ]; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
fi

notify-send "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" \
	-t 1500 -h string:x-canonical-private-synchronous:sound-notification
