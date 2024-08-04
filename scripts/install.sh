# Install basic apps needed for the config to work as intended

sudo pacman -S --needed pacman-contrib grim slurp wl-clipboard firefox viewnior vlc kitty mako xdg-desktop-portal-hyprland polkit-gnome pavucontrol nm-connection-editor ranger waybar hyprpaper qt6ct qt5-wayland qt6-wayland otf-font-awesome noto-fonts-emoji ttf-roboto lxappearance bluez p7zip

yay -S blueman-git bibata-cursor-theme-bin rofi-wayland everforest-gtk-theme-git tela-icon-theme-bin


# Link the config files to the .config folder

for link in $(find ~/ -name "dotfilesHyprland" -type d 2>/dev/null)/config/*
do
    ln -s $link $HOME/.config/
done
