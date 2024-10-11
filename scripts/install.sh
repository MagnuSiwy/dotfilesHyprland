#!/bin/bash

# Install basic apps needed for the config to work as intended
PACKAGES="hyprland hypridle hyprlock pacman-contrib grim slurp wl-clipboard firefox viewnior vlc kitty mako xdg-desktop-portal-hyprland polkit-gnome pavucontrol nm-connection-editor ranger waybar hyprpaper qt6ct qt5-wayland qt6-wayland noto-fonts-emoji nwg-look bluez p7zip blueman rofi-wayland"
echo "Packages to install: $PACKAGES" 

sudo pacman -S --needed $PACKAGES 

# Check if yay is installed
is_yay_installed=$(pacman -Q yay | grep error)
if [ -n $is_yay_installed ]; then
    # Use yay to install other neccessary packages
    echo "Do you want to install wlogout as well? (yay - AUR helper - needed) [Y/n]"
    read choice

    if [[ $choice == "n" ]] || [[ $choice == "N" ]]; then
        echo "Package wlogout will not be installed"
    else
        yay -S --needed wlogout
    fi
else 
    echo "Yay is not installed. Install an AUR helper of your choice. You need it to get wlogout (the logout/shutdown/reboot menu)"
fi


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
