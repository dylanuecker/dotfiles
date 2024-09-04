.PHONY: basic arch vm clean

basic:
	stow --restow bash common fish nvim tmux vim zsh --ignore=".bash_profile|.zprofile"
	stow --restow --no-folding --target='$(HOME)/.local/bin' bin
	cp --no-clobber --recursive 'templates/.' ~

arch: basic
	stow --restow foot hypr mako waybar
	sudo stow --restow --no-folding --target=/ arch

vm: basic
	stow --restow bspwm dunst feh kitty picom sxhkd

clean:
	stow --delete *[^templates]
