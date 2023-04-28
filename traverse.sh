#!/bin/bash

trap "tput cnorm && return" SIGINT

tput civis
while : ; do
	ls --color=always -d */ | tr -d "/" | tr "\n" " " 
	echo -en "\r"
	read -s -n 1 input
	case $input in
		j) cd .. ;;
		*) break ;;
	esac
done
tput cnorm
