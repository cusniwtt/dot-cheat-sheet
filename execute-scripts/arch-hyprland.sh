#!/bin/bash

# This scrit is not installation script, Before run this script
# You need to install Hyprland From https://github.com/JaKooLit/Arch-Hyprland
# This script is only dotfiles and configs config-files
sudo pacman -S waybar hyprpaper hyprpicker cliphist wofi nemo grim slurp swappy nwg-look feh
sudo pacman -S qt5-wayland qt6-wayland mako network-manager-applet polkit-kde-agent
paru -S pyprland waypaper xwaylandvideobridge hyprshade

# Copy Config files
cp -r ../config-files/hypr/ ~/.config/
cp -r ../config-files/wofi/ ~/.config/
cp -r ../config-files/waybar/ ~/.config/ 
cp -r ../config-files/waypaper/ ~/.config/

# Enable ly as SDDM
sudo pacman -S ly
sudo cp ../config-files/ly/config.ini /etc/ly/
sudo systemctl enable ly.service -f

# You need to install Hyprland From https://github.com/JaKooLit/Arch-Hyprland
git clone --depth=1 https://github.com/JaKooLit/Arch-Hyprland.git ~/Arch-Hyprland
cd ~/Arch-Hyprland
chmod +x install.sh
./install.sh
