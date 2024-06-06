.PHONY: basic arch wayland xorg clean

basic:
	stow --restow common nvim vim zsh --ignore=".zprofile"
	cp --no-clobber --recursive 'templates/.' ~

arch: basic wayland
	stow --restow alacritty btop git lf zsh

wayland:
	stow --restow hypr mako waybar

xorg:
	stow --restow bspwm feh i3 picom polybar redshift rofi sxhkd xorg

clean:
	stow --delete *[^templates]
