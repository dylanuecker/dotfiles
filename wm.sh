#!/bin/bash

if [[ $# -ne 2 || ("$1" != "417" && "$1" != "430") || (! "$2" =~ a[0-9]+) ]]; then
	echo "Usage: wm <417|430> a<[0-9]+>"
	exit 1
fi

read -p "Close all windows [Y/n]? " yn
case $yn in
	[Yy]* ) bspc query -D -d .occupied | xargs -i bspc node @{}:/ -c;;
	*     ) bspc node -c;;
esac


if [[ "$1" == "417" ]]; then
	bspc desktop -f '^1';
	alacritty --working-directory ~/$1 -e $1docker.sh;
elif [[ "$1" == "430" ]]; then
	bspc desktop -f '^1';
	alacritty --working-directory ~/$1/$2;
	alacritty --working-directory ~/$1 -e $1docker.sh;
fi
