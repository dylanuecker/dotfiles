#!/bin/sh

temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
if [[ $? == 0 ]]; then
	echo "GPU $temp°C $(printf "%2d" $util)%"
fi
