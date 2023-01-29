#!/bin/bash

show() {
	polybar-msg cmd show 
	bspc config top_padding 21
	#bspc config gapless_monocle false
}

hide () {
	polybar-msg cmd hide 
	bspc config top_padding 0 
	#bspc config gapless_monocle true
}
