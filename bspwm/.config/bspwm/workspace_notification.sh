#!/bin/sh

workspace=$(bspc query -D -d focused --names)
num_windows=$(bspc query -N -d focused -n .!hidden.window | wc -l)

notify-send "$num_windows Window(s) Workspace $workspace" \
    -t 1500 \
    -h string:x-dunst-stack-tag:workspace
