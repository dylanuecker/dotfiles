#!/bin/bash

# TODO
# do something when directory is empty
# try to update PS1 in some way on each cd
# what if number of directories carries over onto more than one line

cleanup() {
	tput el
	tput cnorm
	if [ $toggle = 1 ]; then
		shopt -u dotglob
	fi
	ls
}

trap "cleanup && return" SIGINT

index=0
toggle=0
tput civis
while : ; do
	dirs=($(ls -d */ 2> /dev/null | tr -d "/"))
	output=($(ls --color=always -d */ 2> /dev/null | tr -d "/"))
	output[$index]="\033[31;1m${dirs[$index]}\033[0m"
	echo -en "${output[*]}"
	tput el
	echo -en "\r"
	read -s -n 1 input
	case $input in
		h)
			if [ $index != 0 ]; then
				((index--))
			fi
			;;
		j) 
			cd ${dirs[$index]} 
			index=0
			;;
		k)
			cd ..
			index=0
			;;
		l)
			if [ $index != $(( ${#dirs[@]} - 1)) ]; then
				((index++))
			fi
			;;
		a)
			if [ $toggle == 0 ]; then
				shopt -s dotglob
				toggle=1
			else
				shopt -u dotglob
				toggle=0
			fi
			;;
		d)
			cd
			break
			;;
		f)
			cd
			index=0
			;;
		*) 
			break 
			;;
	esac
done
cleanup
