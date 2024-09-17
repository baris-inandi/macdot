#!/usr/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -f -s ~/me/mindot/config/.zshrc ~/.zshrc
ln -f -s ~/me/mindot/config/.gitconfig ~/.gitconfig
mkdir ~/.local/bin
