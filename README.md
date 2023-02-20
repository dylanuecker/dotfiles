# dotfiles

There were several config files that are not tracked, next
time I do a complete install, I will need to remember to
do so.

Important system maintenance:
- 'pacman -Syu' for system update and upgrade
- cleaning pacman cache and update mirror list automatically done weekly
- journalctl

Finally using nvidia drivers with PRIME for hybrid graphics. Use the two scripts
in here to enable and disable the GTX 1050 ti mobile.

TODO:
When switching between desktops with bspwm, there is quick way to prevent wrapping
around at the ends (e.g. 1 and 5).

Swapping desktops (this is builtin and should be easy, just way too late right now
for me to worry about it)

I leave figuring out HDMI to you later, my friend. Will definitely have to
enable GPU first, and maybe restart xorg since nvidia module needs to be
loaded before xorg starts. I don't know you'll figure it out.

I also should really be using relative paths in here (e.g. in case I want to move
~/dotfiles to ~/.dotfiles)
