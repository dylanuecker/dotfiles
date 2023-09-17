#!/bin/sh
if [[ $HOSTNAME == "cloudbreak" ]]; then
	temp=$(sensors coretemp-isa-0000 | grep "Package id 0" | awk '{print $4}' | cut -c 2-3)
else
	temp=$(sensors k10temp-pci-00c3 | grep Tctl | awk '{print $2}' | cut -c 2-3)
fi
echo "CPU $temp°C "
