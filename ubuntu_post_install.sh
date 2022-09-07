#!/bin/bash -v

sudo apt update

sudo apt upgrade

sudo apt install vim -y

sudo apt install git -y

cp -a dotfiles/. ~/

mkdir -p ~/.hidden/
mv ~/Desktop/ ~/Documents/ ~/Downloads/ ~/Music/ ~/Pictures/ ~/Public/ ~/Templates/ ~/Videos/ ~/.hidden/
cp gnome-files/user-dirs.dirs ~/.config/

dconf load /org/gnome/terminal/ < gnome-files/gnome_terminal_settings.txt

gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

git config --global user.email "dylan.uecker@gmail.com"
git config --global user.name "Dylan Uecker"
git config --global core.editor "vim"
