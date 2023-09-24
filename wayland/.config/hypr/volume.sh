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

	track=$(playerctl metadata --format '{{title}}')
	artist=$(playerctl metadata --format '{{artist}}')
	album=$(playerctl metadata --format '{{album}}')

	icon_url=$(playerctl metadata | grep artUrl | awk '{ print $3 }')
	if [[ -n $icon_url ]]; then
		icon_name=${icon_url##*/}
		icon=~/.config/mako/cover-cache/$icon_name
		if [ ! -f $icon ]; then
			curl $icon_url --output $icon
		fi
	else
		# local file
		icon=~/.spotify-local-music/covers/"$album".jpg
	fi

	if [[ "$(playerctl status)" = "Paused" ]]; then
		paused="PAUSED"
	fi

	if [[ ! -f $icon ]]; then
		icon=~/.config/mako/default
	fi

	# fix pango & in body
	artist=$(sed 's/&/&amp;/g' <<< $artist)
	album=$(sed 's/&/&amp;/g' <<< $album)

	notify-send "$track" "$artist - $album\n<span color='#81a2be'>Volume $volume</span> <span color='#e03a3e' weight='bold'>$paused</span>" \
		-t 3000 -h string:x-canonical-private-synchronous:sound-notification \
		--icon="$icon"
elif [[ $skip != "true" ]]; then
	notify-send "Volume $volume" \
		-t 1500 -h string:x-canonical-private-synchronous:sound-notification
fi
