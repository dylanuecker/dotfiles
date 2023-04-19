#!/bin/bash

#text="$(fortune -a | fmt -200 -s)"
#
#issue="$(cowthink -f snoopy-doghouse <<< $text)"
#issue+=$'\n' # new line between username enter
#
#echo "$issue" > /etc/issue

issue="Arch Linux \e{lightred}\r\e{reset} (\l)" 
issue+=$'\n\n'
issue+="\e{lightcyan}$(fortune -a)\e{reset}" 
issue+=$'\n'

echo "$issue" > /etc/issue
