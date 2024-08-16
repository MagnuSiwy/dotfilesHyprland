#!/bin/bash

# Install basic apps needed for the config to work as intended
PACKAGES="hyprland hypridle hyprlock pacman-contrib grim slurp wl-clipboard firefox viewnior vlc kitty mako xdg-desktop-portal-hyprland polkit-gnome pavucontrol nm-connection-editor ranger waybar hyprpaper qt6ct qt5-wayland qt6-wayland noto-fonts-emoji nwg-look bluez p7zip blueman rofi-wayland"
echo "Packages installation: $PACKAGES" 

sudo pacman -S --needed $PACKAGES 


# Link the config files to the .config folder

DOTFILES_LOCATION=$(find ~/ -name "dotfilesHyprland" -type d 2>/dev/null)

echo "Linking config files to .config..."
for link in $DOTFILES_LOCATION/config/*
do
    ln -s $link $HOME/.config/
done

echo "Linking fonts, theme, cursor, icons to their respective folders in $HOME..."
for link in $DOTFILES_LOCATION/appearance/.*
do
    ln -s $link $HOME/
done
