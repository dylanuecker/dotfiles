#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# hide polybar on every workspace except for 1 by default
for i in {2..5}; do
	touch /tmp/polybarhidden$i
done

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar dat 2>&1 | tee -a /tmp/polybar.log & disown
