arch:
	stow --restow alacritty btop git lf vim wayland zsh

vm:
	stow --restow vim zsh
	scripts/append_bashrc.sh

delete:
	stow --delete */
