.PHONY: arch common vm wayland xorg delete

arch: wayland
	stow --restow alacritty btop git lf zsh

vm:
	tee --append ~/.bashrc < bash/.bashrc

wayland:
	stow --restow hypr mako swaylock waybar

xorg:
	stow --restow bspwm feh i3 picom polybar redshift rofi sxhkd xorg

%: common
	stow --restow common vim
	@if [ ! -f ~/.lmshrc ]; then\
		echo -e "# shell configuration local to this machine\n# e.g. export NOVIMSTATUSLINE=-" | tee ~/.lmshrc;\
	fi

common: ;

delete:
	stow --delete */
