#!/bin/sh

if [ -f ~/.config/waybar/hidestats ]; then
	exit
fi

disk () {
	echo "/ $(df --output=pcent / | tr -dc '0-9')%"
}

memory () {
	usage=$(free | grep Mem | awk '{printf "%2.0f", $3/$2 * 100.0}')
	echo "MEM $usage%"
}

cpu () {
	if [[ $HOSTNAME == "cloudbreak" ]]; then
		temp=$(sensors coretemp-isa-0000 | grep "Package id 0" | awk '{print $4}' | cut -c 2-3)
	else
		temp=$(sensors k10temp-pci-00c3 | grep Tctl | awk '{print $2}' | cut -c 2-3)
	fi

	prevcpu=(`cat /proc/stat | grep '^cpu '`)
	unset prevcpu[0]
	previdle=${prevcpu[4]}
	prevtotal=0
	for val in "${prevcpu[@]}"; do
		prevtotal=$((prevtotal + val))
	done

	sleep 0.5

	cpu=(`cat /proc/stat | grep '^cpu '`)
	unset cpu[0]
	idle=${cpu[4]}
	total=0
	for val in "${cpu[@]}"; do
		total=$((total + val))
	done

	usage=$((100 * ((total - prevtotal) - (idle - previdle)) / (total - prevtotal)))
	echo "CPU $temp°C $(printf "%2d" $usage)%"
}

gpu () {
	if [[ $HOSTNAME != "cloudbreak" || ! -f /etc/modprobe.d/disable-nvidia.conf ]]; then
		temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)
		util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
		echo "GPU $temp°C $(printf "%2d" $util)%"
	fi
}

echo "$(disk) $(memory) $(cpu) $(gpu)"
