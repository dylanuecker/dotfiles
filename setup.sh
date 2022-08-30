#!/bin/bash

sudo apt update
echo
sudo apt upgrade
echo
sudo apt install vim -y
echo
sudo apt install git -y
echo

cp -a to_home/. ~/
echo "Copied to_home to home"

git config --global user.email "dylan.uecker@gmail.com"
git config --global user.name "Dylan Uecker"
git config --global core.editor "vim"
echo "Bare minimum git configurations made"

