#!/bin/bash

cd dotfiles
pacman -Qqe > pkglist.txt
git add pkglist.txt
git commit -m "Update package list"
git push
