#!/bin/sh

file="/tmp/bluetoothon"

if [[ -f $file ]]; then
	bluetoothctl power off
	rfkill block bluetooth
	rm $file
else
	rfkill unblock bluetooth
	bluetoothctl power on
	touch $file
	blueman-manager & disown
fi
