#!/usr/bin/bash

mkdir -p ~/.config/fish/
ln -f -s ~/me/mindot/config/config.fish ~/.config/fish/config.fish

mkdir -p ~/.config/alacritty/
ln -f -s ~/me/mindot/config/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -f -s ~/me/mindot/config/colors.yml ~/.config/alacritty/colors.yml

ln -f -s ~/me/mindot/config/.gitconfig ~/.gitconfig
