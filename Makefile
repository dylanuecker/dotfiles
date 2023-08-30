error:
	@echo "Give me a target."

laptop:
	stow --restow alacritty bash git vim wallpaper xorg
	
pc:
	stow --restow alacritty git vim wallpaper zsh

delete:
	stow --delete */
