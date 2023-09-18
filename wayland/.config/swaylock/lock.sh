#!/bin/sh
image=/home/dylan/.config/lockscreen

grim $image
convert $image -blur 0x6 $image
swaylock
