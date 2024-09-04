#!/usr/bin/sh
# $1 is scratchpad "index" number
# $2 is unhide at start
#
# check if scratchpad is running, if not start it
[ "$(ps -x | grep -c "scratchpad$1")" -eq "1" ] && kitty --override background_opacity=1 --class scratchpad$1 ~/.config/bspwm/scratch.sh $1 $2 &
