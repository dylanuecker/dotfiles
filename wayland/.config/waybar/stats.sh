#!/bin/sh

if [ -f ~/.config/waybar/hidestats ]; then
	exit
fi

disk () {
	echo "/ $(df --output=pcent / | tr -dc '0-9')%"
}

memory () {
	memUsage=$(free -m | awk '/Mem/{print $3}')
	echo "MEM USAGE%"
}

cpu () {
	if [[ $HOSTNAME == "cloudbreak" ]]; then
		temp=$(sensors coretemp-isa-0000 | grep "Package id 0" | awk '{print $4}' | cut -c 2-3)
	else
		temp=$(sensors k10temp-pci-00c3 | grep Tctl | awk '{print $2}' | cut -c 2-3)
	fi
	usage=$(top -bn1 | awk '/Cpu/ {printf "%2.0f", $2}')
	echo "CPU $temp°C USAGE%"
}

gpu () {
	if [[ $HOSTNAME != "cloudbreak" || ! -f /etc/modprobe.d/disable-nvidia.conf ]]; then
		temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
		util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
		echo "GPU $temp°C $(printf "%2d" $util)%"
	fi
}

echo "$(disk) $(memory) $(cpu) $(gpu)"
