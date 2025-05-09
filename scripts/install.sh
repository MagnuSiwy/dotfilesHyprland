#!/bin/bash

# Install basic apps needed for the config to work as intended
PACKAGES="hyprland hypridle hyprlock pacman-contrib grim slurp wl-clipboard firefox vlc kitty mako xdg-desktop-portal-gtk xdg-desktop-portal-hyprland polkit-gnome pavucontrol nm-connection-editor ranger waybar hyprpaper qt6ct qt5-wayland qt6-wayland noto-fonts-emoji nwg-look bluez p7zip blueman rofi-wayland rofi-calc calcurse socat greetd nwg-hello brightnessctl uwsm"
echo "Packages to install: $PACKAGES" 

sudo pacman -S --needed $PACKAGES 

# Check if yay is installed
is_yay_installed=$(pacman -Q yay | grep error)
if [ -n $is_yay_installed ]; then
    # Use yay to install other neccessary packages
    echo "Do you want to install wlogout as well? [Y/n]"
    read choice

    if [[ $choice == "n" ]] || [[ $choice == "N" ]]; then
        echo "Package wlogout will not be installed"
    else
        yay -S --needed wlogout
    fi
else 
    echo "Yay is not installed. You need to get wlogout (the logout/shutdown/reboot menu) on your own."
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

echo "Copying fonts, theme, cursor and icons to their respective folders in /usr/share/..."
sudo cp -r $DOTFILES_LOCATION/appearance/.fonts/Roboto* /usr/share/fonts/
sudo cp -r $DOTFILES_LOCATION/appearance/.themes/Everforest-Green-Darker /usr/share/themes/
sudo cp -r $DOTFILES_LOCATION/appearance/.icons/Bibata-Original-Classic /usr/share/icons/
sudo cp -r $DOTFILES_LOCATION/appearance/.icons/Tela-black-dark /usr/share/icons/

echo "Copying greetd and nwg-hello config files to their respective folders in /etc/..."
sudo cp $DOTFILES_LOCATION/greeter/nwg-hello/* /etc/nwg-hello/
sudo cp $DOTFILES_LOCATION/greeter/greetd/* /etc/greetd/
sudo cp $DOTFILES_LOCATION/greeter/icons/* /usr/share/nwg-hello/
sudo mkdir /usr/share/wallpapers
sudo cp $DOTFILES_LOCATION/config/hypr/wallpapers/plantWall_LeonardoAI.jpg /usr/share/wallpapers/

echo "Add the custom shutdown and reboot grub menu options"
sudo cp ~/dotfilesHyprland/grub/40_custom /etc/grub.d/

echo "Enable required services (waybar, hyprpaper, hypridle, playerctl, greetd)"
sudo systemctl daemon-reload
systemctl --user enable waybar.service
systemctl --user enable hyprpaper.service
systemctl --user enable hypridle.service
systemctl --user enable playerctld.service
systemctl --user enable polkit-gnome.service
systemctl --user enable kanshi.service
sudo systemctl enable greetd

echo ""
echo "Done! Have fun on your new system!"
