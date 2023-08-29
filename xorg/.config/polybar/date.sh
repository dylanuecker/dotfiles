#!/bin/bash

# one bit: mdy
# two bit: seconds
dosbit=0
sleep_pid=0

mdy() {
	(( dosbit^=1 ))

	if [ "$sleep_pid" -ne 0 ]; then
		kill $sleep_pid >/dev/null 2>&1
	fi
}

sec() {
	(( dosbit^=2 ))

	if [ "$sleep_pid" -ne 0 ]; then
		kill $sleep_pid >/dev/null 2>&1
	fi
}

trap "mdy" USR1
trap "sec" USR2

while true; do
	cmd_string="date +"

	if (( $dosbit & 1 )); then
		cmd_string+="%-m/%-d/%Y\ " # month/day/year
	fi

	cmd_string+="%-l:%M" # hour:minute

	if (( $dosbit & 2 )); then
		cmd_string+=":%S"
	fi

	cmd_string+="\ %p" # AM or PM

	eval $cmd_string

	sleep 1 &
	sleep_pid=$!
	wait
done
