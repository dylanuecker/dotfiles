.PHONY: basic arch vm clean

basic:
	stow --restow bash common fish nvim tmux vim zsh --ignore=".bash_profile|.zprofile"
	cp --no-clobber --recursive 'templates/.' ~

arch: basic
	stow --restow foot hypr mako waybar

vm: basic
	stow --restow bspwm dunst kitty sxhkd

clean:
	stow --delete *[^templates]
