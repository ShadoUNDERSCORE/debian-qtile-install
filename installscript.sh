#!/bin/bash

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
  | gpg --dearmor \
  | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg > /dev/null

echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
  | sudo tee /etc/apt/sources.list.d/vscodium.list

# Ghostty
curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/ghostty.gpg > /dev/null

echo 'deb http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/ /' \
  | sudo tee /etc/apt/sources.list.d/ghostty.list

# Vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/vivaldi.gpg > /dev/null

echo "deb [arch=amd64] https://repo.vivaldi.com/archive/deb/ stable main" \
  | sudo tee /etc/apt/sources.list.d/vivaldi.list > /dev/null

apt update
apt install -y sudo curl qtile lightdm rofi feh picom lxappearence nemo codium vivaldi-stable ghostty \
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
