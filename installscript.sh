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
apt install -y sudo curl qtile lightdm rofi feh picom lxappearence nemo code vivaldi-stable ghostty \
  neovim zsh oh-my-zsh python3-pip build-essential network-manager-gnome xserver-xorg x11-utils x11-server-utils \
  papirus-icon-theme fonts-noto-color-emoji p7zip-full pipewire pipewire-audio pipewire-pulse wireplumber pavucontrol \
  bluetooth bluez blueman volumeicon

apt update
apt upgrade

echo 'export PATH="/sbin:$PATH"' | tee -a ~/.zshrc ~/.bashrc > /dev/null

if ["$1"]; then
  usermod -aG sudo $1
fi

chsh -s $(which zsh)

# Replace Config Files

# mv ./ghostty/config ~/.config/ghostty/config
# mv ./qtile/config.py ~/.config/qtile/config.py
# mv ./zsh/.zshrc ~/.zshrc
