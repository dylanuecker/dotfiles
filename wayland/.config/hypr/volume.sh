#!/bin/sh

if [ $1 = 'up' ]; then
	wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%+
elif [ $1 = 'down' ]; then
	wpctl set-volume --limit 1.0 @DEFAULT_AUDIO_SINK@ 5%-
elif [ $1 = 'togglemute' ]; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
else
	skip="true"
fi

status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
if [[ -n $(grep MUTED - <<< $status) ]]; then
	volume="muted"
else
	volume=$(awk '{printf "%d%%", $2 * 100}' <<< $status)
fi

if [[ -n $(ps -e | grep spotify) ]]; then
	if [ $1 = 'previous' ]; then
		playerctl previous
	elif [ $1 = 'play-pause' ]; then
		playerctl play-pause
	elif [ $1 = 'next' ]; then
		playerctl next
	fi

	sleep .1

	track=$(playerctl metadata --format '{{trunc(title, 20)}}')
	artistalbum=$(playerctl metadata --format '{{trunc(artist, 20)}} - {{trunc(album, 20)}}')
    #duration=$(playerctl metadata --format '[{{duration(position)}}/{{duration(mpris:length)}}]')

	if [[ "$(playerctl status)" = "Playing" ]]; then
		#icon_url=$(playerctl metadata | grep artUrl | awk '{ print $3 }')
		#icon=~/.config/mako/icon
		#curl $icon_url --output $icon
		icon=~/.config/mako/play
	else
		icon=~/.config/mako/paused
	fi

	notify-send "$track" "$artistalbum\nVolume $volume" \
		-t 3000 -h string:x-canonical-private-synchronous:sound-notification \
		--icon=$icon
elif [[ $skip != "true" ]]; then
	notify-send "Volume $volume" \
		-t 1500 -h string:x-canonical-private-synchronous:sound-notification
fi
