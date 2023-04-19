#!/bin/bash

#text="$(fortune -a | fmt -200 -s)"
#
#issue="$(cowthink -f snoopy-doghouse <<< $text)"
#issue+=$'\n' # new line between username enter
#
#echo "$issue" > /etc/issue

issue="\e{lightcyan}Arch Linux\e{reset}\e{lightred} \r\e{reset}" 
issue+=$'\n\n'
issue+="\e{lightgreen}$(fortune -a)\e{reset}" 
issue+=$'\n'

echo "$issue" > /etc/issue
