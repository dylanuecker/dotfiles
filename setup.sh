#!/bin/bash -v

sudo apt update

sudo apt upgrade

sudo apt install vim -y

sudo apt install git -y

cp -a dotfiles/. ~/

mkdir -p ~/.hidden/
cp settings/user-dirs.dirs ~/.config/

git config --global user.email "dylan.uecker@gmail.com"
git config --global user.name "Dylan Uecker"
git config --global core.editor "vim"
