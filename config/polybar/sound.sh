#!/bin/bash 

# example output: "Volume: 0.30 [MUTED]"
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
arr=($vol)

if [ ${#arr[*]} -eq 3 ]; then # array has len 3
	echo ﱝ # muted volume
	exit
else
	dec=${arr[1]}
	tens=${dec:2:1}

	if [ $tens -lt 3 ]; then
		echo 奄
	elif [ $tens -lt 6 ]; then
		echo 奔
	else
		echo 墳
	fi
fi
