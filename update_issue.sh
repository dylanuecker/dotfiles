#!/bin/bash

text="$(fortune -a | fmt -80 -s)"

issue="$(cowthink -f snoopy-doghouse <<< $text)"
issue+=$'\n' # new line between username enter

echo "$issue" > /etc/issue
echo "$issue"
