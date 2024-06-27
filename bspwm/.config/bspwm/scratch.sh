#!/usr/bin/sh
# $1 is scratchpad "index" number
# $2 is unhide at start
#
# add floating scratchpad window node id to /tmp/scratchid$1
bspc query -N -n .floating | xargs -i sh -c "bspc query  --node {} -T | grep -q scratchpad$1 && echo {} > /tmp/scratchid$1"
if [ $# -eq 2 ]; then
    id=$(cat /tmp/scratchid$1)
    bspc node $id --flag hidden
    bspc node -f $id
fi
exec fish
