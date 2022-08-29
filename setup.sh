#! /bin/bash

cp .vimrc ~/
echo "Copied .vimrc to home directory"

cp -r .vim ~/
echo "Copied .vim directory to home directory"

cp .bashrc ~/
echo "Copied .bashrc to home directory"

git config --global user.name "Dylan Uecker"
git config --global user.email dylan.uecker@gmail.com
git config --global core.editor vim
echo -e "Bare minimum git configurations made\n"

apt update
apt upgrade

