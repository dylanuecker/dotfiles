#!/bin/bash

if bluetoothctl show | grep -q "Powered: yes"; then
	echo "%{F#81a2be}%{F-}" # primary color defined in polybar config
else
	echo "" # keep it clean and pretty
fi

