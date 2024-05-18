#!/bin/sh
screenshot=/home/dylan/.config/lockscreen
grim -s 1.5 -l 0 $screenshot
convert $screenshot -scale 20% -blur 0x2 -resize 200% $screenshot
hyprlock
