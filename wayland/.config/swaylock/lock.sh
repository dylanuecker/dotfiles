#!/bin/sh
image=/home/dylan/.config/lockscreen

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	hyprctl dispatch dpms off
fi

grim $image
convert $image -blur 0x6 $image 

if [[ "$HOSTNAME" == "cloudbreak" ]]; then
	sleep 0.5; (sleep 0.5; hyprctl dispatch dpms on) &
fi

swaylock; killall -SIGUSR2 waybar
