#!/bin/bash

for file in home/*
do
	justfile=${file#home/}
	ln -sfT ~/dotfiles/home/$justfile ~/.$justfile
	echo "created symlink for ~/.$justfile"
done

for file in config/*
do
	justfile=${file#config/}
	ln -sfT ~/dotfiles/config/$justfile ~/.config/$justfile
	echo "created symlink for ~/.config/$justfile"
done

ln -sfT ~/dotfiles/libre/pptx2pdf.sh ~/.local/bin/pptx2pdf
echo "create symlink for ~/.local/bin/pptx2pdf"
