#!/bin/bash
if [ -f /tmp/polybarhidden ]; then 
  polybar-msg cmd show 
  bspc config top_padding 45 
  rm /tmp/polybarhidden 
else 
  polybar-msg cmd hide 
  bspc config top_padding 0 
  touch /tmp/polybarhidden 
fi
