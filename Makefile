error:
	@echo "Give me a target."

laptop:
	stow --restow alacritty bash btop git vim xorg
	
pc:
	stow --restow alacritty btop git vim wayland zsh

delete:
	stow --delete */
