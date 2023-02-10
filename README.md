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
I leave figuring out HDMI to you later, my friend. Will definitely have to
enable GPU first, and maybe restart xorg since nvidia module needs to be
loaded before xorg starts. I don't know you'll figure it out.
