error:
	@echo "Give me a target."

laptop:
	stow --restow alacritty bash git vim wallpaper xorg

delete:
	stow --delete */
