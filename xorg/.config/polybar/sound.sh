#!/bin/bash 

# example output: "Volume: 0.30 [MUTED]"
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
arr=($vol)

if [ ${#arr[*]} -eq 3 ]; then # array has len 3
	echo  # muted
	exit
else
	dec=${arr[1]}
	ones=${dec:0:1}
	tens=${dec:2:1}

	if [ $tens -ge 6 ] || [ $ones -eq 1 ]; then
		echo 
	elif [ $tens -ge 3 ]; then
		echo 
	else
		echo 
	fi
fi
