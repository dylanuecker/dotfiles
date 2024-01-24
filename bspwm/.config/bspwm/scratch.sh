#!/usr/bin/sh
# $1 is scratchpad "index" number
#
# add floating scratchpad window node id to /tmp/scratchid$1
bspc query -N -n .floating | xargs -i sh -c "bspc query  --node {} -T | grep -q scratchpad$1 && echo {} > /tmp/scratchid$1"
exec $SHELL
