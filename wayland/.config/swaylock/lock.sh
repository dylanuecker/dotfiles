#!/bin/sh
image=/home/dylan/.config/lockscreen

hyprctl keyword general:cursor_inactive_timeout 1

grim $image

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	hyprctl dispatch dpms off
fi

convert $image -blur 0x6 $image 

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	sleep 0.5; (sleep 0.5; hyprctl dispatch dpms on) &
fi

swaylock; hyprctl keyword general:cursor_inactive_timeout 0; killall -SIGUSR2 waybar
