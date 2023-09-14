#!/bin/sh

temp=$(sensors k10temp-pci-00c3 | grep Tctl | awk '{print $2}' | cut -c 2-3)
echo "CPU $temp°C "
