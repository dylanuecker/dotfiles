.PHONY: basic arch vm clean

basic:
	stow --restow bash common fish nvim tmux vim --ignore=".bash_profile"
	cp --no-clobber --recursive 'templates/.' ~

arch: basic
	stow --restow hypr mako waybar

vm: basic
	stow --restow bspwm dunst kitty sxhkd

clean:
	stow --delete *[^templates]
