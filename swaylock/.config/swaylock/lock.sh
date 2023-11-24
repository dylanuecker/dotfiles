#!/bin/sh
imagea=/home/dylan/.config/lockscreena
imageb=/home/dylan/.config/lockscreenb

touch /tmp/screenislocked

hyprctl keyword general:cursor_inactive_timeout 1

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	grim $imagea
	hyprctl dispatch dpms off
else
	grim -o DP-1 $imagea
	grim -o HDMI-A-2 $imageb
	convert $imageb -blur 0x6 $imageb
fi

convert $imagea -blur 0x6 $imagea 

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	sleep 0.5; (sleep 0.5; hyprctl dispatch dpms on) &
	images="--image eDP-1:$imagea"
else
	images="--image DP-1:$imagea --image HDMI-A-2:$imageb"
fi

swaylock $images; hyprctl keyword general:cursor_inactive_timeout 0; killall -SIGUSR2 waybar; rm /tmp/screenislocked
