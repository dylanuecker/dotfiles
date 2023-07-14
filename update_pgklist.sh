#!/bin/bash

cd /home/dylan/dotfiles
pacman -Qqe > pkglist.txt
if [[ 'git status --porcelain pkglist.txt' ]]; then
	git add pkglist.txt
	git commit -m "Update package list"
fi
