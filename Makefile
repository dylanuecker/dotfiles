.PHONY: basic arch vm clean

basic:
	stow --restow bash common fish nvim tmux vim zsh --ignore=".bash_profile|.zprofile|.bashrc|.zshrc"
	mkdir -p '$(HOME)/.local/bin'
	stow --restow --no-folding --target='$(HOME)/.local/bin' bin
	cp -n -R 'templates/.' ~

arch: basic
	stow --restow foot hypr mako waybar
	stow --restow --no-folding --target='$(HOME)/.config/systemd' systemd
	sudo stow --restow --no-folding --target=/ arch

vm: basic
	stow --restow bspwm dunst feh kitty picom sxhkd

clean:
	stow --delete *[^templates]
