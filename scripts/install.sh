# Install basic apps needed for the config to work as intended

yay -S --needed hyprland hypridle hyprlock pacman-contrib grim slurp wl-clipboard firefox kitty mako xdg-desktop-portal-hyprland polkit-gnome pavucontrol nm-connection-editor ranger waybar hyprpaper qt6ct qt5-wayland qt6-wayland noto-fonts-emoji nwg-look bluez p7zip blueman-git rofi-wayland calcurse


# Link the config files to the .config folder

DOTFILES_LOCATION=$(find ~/ -name "dotfilesHyprland" -type d 2>/dev/null)

for link in $DOTFILES_LOCATION/config/*
do
    ln -s $link $HOME/.config/
done

for link in $DOTFILES_LOCATION/appearance/.*
do
    ln -s $link $HOME/
done
