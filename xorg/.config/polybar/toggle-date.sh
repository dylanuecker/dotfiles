#!/bin/bash

source /home/dylan/.config/polybar/toggle-functions.sh

pid=$(pgrep date.sh)

if [ "$1" = "mdy" ]; then
	kill -USR1 $pid
elif [ "$1" = "sec" ]; then
	kill -USR2 $pid
fi
