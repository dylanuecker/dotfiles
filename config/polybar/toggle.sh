#!/bin/bash
if [ -f /tmp/polybarhidden ]; then 
	polybar-msg cmd show 
	bspc config top_padding 32
	bspc config gapless_monocle false
	rm /tmp/polybarhidden 
else 
	polybar-msg cmd hide 
	bspc config top_padding 0 
	bspc config gapless_monocle true
	touch /tmp/polybarhidden 
fi
