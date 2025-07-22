#!/bin/bash

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Ghostty
echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/ /' \
  | sudo tee /etc/apt/sources.list.d/ghostty.list

curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key \
  | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ghostty.gpg > /dev/null

# Vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | \
  sudo tee /etc/apt/trusted.gpg.d/vivaldi.gpg > /dev/null

echo "deb [arch=amd64] https://repo.vivaldi.com/archive/deb/ stable main" | \
  sudo tee /etc/apt/sources.list.d/vivaldi.list > /dev/null

apt update
apt install sudo curl qtile lightdm rofi feh picom lxappearence nemo code vivaldi-stable ghostty neovim zsh oh-my-zsh -y

apt update
apt upgrade

echo 'export PATH="/sbin:$PATH"' | tee -a ~/.zshrc ~/.bashrc > /dev/null

usermod -aG sudo $1

chsh -s $(which zsh)

# Replace Config Files

# mv ./ghostty/config ~/.config/ghostty/config
# mv ./qtile/config.py ~/.config/qtile/config.py
# mv ./zsh/.zshrc ~/.zshrc
