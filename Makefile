error:
	@echo "Give me a target."

laptop:
	stow --restow alacritty bash git vim xorg
	
pc:
	stow --restow alacritty git vim wayland zsh

delete:
	stow --delete */
