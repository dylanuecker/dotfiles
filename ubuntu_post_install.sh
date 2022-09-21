#!/bin/bash

echo -n "Manage packages[Y/n]? "
read choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
	set -v
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install vim -y
	sudo apt install git -y
	set +v
fi

if [ ! -d ~/.hidden/ ]; then
	set -v
	mkdir ~/.hidden/
	mv ~/Desktop/ ~/Documents/ ~/Downloads/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/ ~/.hidden/
	set +v
fi

set -v

cp -a dotfiles/. ~/

cp gnome-files/user-dirs.dirs ~/.config/
dconf load /org/gnome/terminal/ < gnome-files/gnome_terminal_settings.txt

gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

git config --global user.email "55552716+dylanuecker@users.noreply.github.com"
git config --global user.name "Dylan Uecker"
git config --global core.editor "vim"

