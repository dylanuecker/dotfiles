#!/bin/sh

desktop=$(bspc query -D -d focused --names)
num_windows=$(bspc query -N -d focused -n .!hidden.window | wc -l)

notify-send "Desktop $desktop Windows $num_windows" \
    -t 1500 \
    -h string:x-dunst-stack-tag:desktop
    
