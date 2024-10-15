#! /bin/bash

# This script turns off the laptop screen if an external display is connected
# You can change the monitor names to whatever you want (hyprctl monitors to list the available monitors)

laptopScreen=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | head -n 1)
extScreen=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | tail -n 1)

if [ $(hyprctl monitors all | grep Monitor | wc -l) -ge 2 ]; then
    hyprctl keyword monitor $laptopScreen,disable
	hyprctl keyword monitor $extScreen,highrr,0x0,1
else
	hyprctl keyword monitor $laptopScreen,preferred,auto,1
fi
