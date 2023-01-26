#!/bin/bash

t=0
sleep_pid=0

toggle() {
	t=$(((t + 1) % 3))

	if [ "$sleep_pid" -ne 0 ]; then
		kill $sleep_pid >/dev/null 2>&1
	fi
}

trap "toggle" USR1

while true; do
	if [ $t -eq 0 ]; then
		date +%-l:%M\ %p
	elif [ $t -eq 1 ]; then
		date +%-m/%-d/%Y\ %-l:%M\ %p
	else
		date +%-m/%-d/%Y\ %-l:%M:%S\ %p
	fi
	sleep 1 &
	sleep_pid=$!
	wait
done
