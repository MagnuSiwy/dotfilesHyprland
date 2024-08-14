
# Dotfiles for [Hyprland](https://github.com/hyprwm/Hyprland) Tiling Window Manager (only for Arch based distros)

# Installation

### With an installation script
To use the dotfiles you need some packages (some of them listed below with a short explanation why you need them). You can easily start using the dotfiles after using `install.sh` script. You can find it in the _scripts_ folder.**The script needs yay and sudo to work.** It's role is to install all of the packages that are needed to use the dotfiles, link the config files where they need to be and link the appearance packages to their respective directories. Cursor theme and fonts are unmodified however the GTK theme has been slightly changed (darker background). The script also links the grub theme and `custom_40` file to grub config (for restart and shutdown buttons in the grub menu). For the grub theme to work after running the script you need to change the theme in _/etc/default/grub_ and update the grub.

Sometimes Hyprland fails to set a cursor or a GTK theme properly. That's why we need _nwg-look_. Just change these in the GUI GTK settings app. It's also recommended to change the default font in GTK settings and QT6 settings apps.

### Manually
If you link the config to where the files should be, you can just `git pull` after the config gets an update and get the latest changes. If any files have been added, just run `install.sh` once again (it will not install anything you already have and will not link anything if files exist). If you just copy the files, you will have to copy them again with each dotfiles update so be ready to do that manually each time.
Link/copy the files from _config_ to your `$HOME/.config` directory:

```
ln -s ~/dotfilesHyprland/config/* ~/.config/     # Set your own dotfilesHyprland directory if needed
```

Link/copy the files from _appearance_ to your `$HOME` directory:

```
ln -s ~/dotfilesHyprland/appearance/.* ~/     # Set your own dotfilesHyprland directory if needed
```

Link/copy the grub theme from _grub_ to _/boot/grub/themes_ and link/copy the `custom_40` file with the custom menu settings to _/etc/grub.d/_:

```
ln -s ~/dotfilesHyprland/grub/whatever_theme /boot/grub/themes/     # Set your own dotfilesHyprland directory if needed
ln -s ~/dotfilesHyprland/grub/custom_40 /etc/grub.d/
```


# Some packages explained:
 - [hyprlock](https://github.com/hyprwm/hyprlock) (lock screen)
 - [hypridle](https://github.com/hyprwm/hypridle) (idle management)
 - [rofi-wayland](https://github.com/lbonn/rofi) (dmenu - Roboto Mono Nerd Font needed)
 - [mako](https://github.com/sqlalchemy/mako) (notifications)
 - [ranger](https://github.com/ranger/ranger) (TUI file manager)
 - [kitty](https://github.com/kovidgoyal/kitty) (terminal)
 - [polkit-gnome](https://gitlab.gnome.org/Archive/policykit-gnome) (graphical authentication thingy)
 - [nwg-look](https://github.com/nwg-piotr/nwg-look) (GUI to set the GTK theme)
 - [grim](https://github.com/emersion/grim) and [slurp](https://github.com/emersion/slurp) (screenshot utilities)
 - [calcurse](https://github.com/lfos/calcurse) (terminal calendar)
 - [blueman](https://github.com/blueman-project/blueman) (GUI for handling bluetooth devices)
 - qt6ct, qt5-wayland, qt6-wayland (GUI's to set the QT theme and the libraries for qt apps)
 - pacman-contrib (needed for checkupdates widget)


# Some additional info
The bar is divided into segments:
 - LEFT: Calendar, CPU usage, RAM usage, Updates Checker (pacman-contrib has to be installed), Window name
 - MIDDLE: Workspaces
 - RIGHT: System Tray, Sound, Bluetooth (disappears if disabled), WiFi, Battery (disappears if disabled), Clock

The sound widget opens the _pavucontrol_ app on mouse right click. You can change the volume with mouse scroll and mute the sound with right click. WiFi widget opens _nm-connectino-editor_ and bluetooth widget opens _blueman-manager_. Also, calendar widget opens _calcurse_ and checkupdates widget opens your terminal with _checkupdates_ program running. You can also update your system by left clicking it (runs yay -Syu).


# Theming:
 - [Everforest theme](https://github.com/sainnhe/everfores) (GTK only)
 - [Bibata Original Classic](https://github.com/ful1e5/Bibata_Cursor) Cursor Theme
 - [Tela Black Dark](https://github.com/vinceliuice/Tela-icon-theme) Icon theme
 - [Roboto](https://github.com/googlefonts/roboto) Font
 - [RobotoMono Nerd Font](https://www.nerdfonts.com/contributors) 
 - [FontAwesome](https://github.com/FortAwesome/Font-Awesome) Font


# Screenshots

![Screenshot]()
![Screenshot]()
![Screenshot]()
![Screenshot]()
