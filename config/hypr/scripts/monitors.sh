#! /bin/bash

# This script turns off the laptop screen if an external display is connected
# You can change the monitor names to whatever you want (hyprctl monitors to list the outputs)

laptopScreen="eDP-1"
extScreen="HDMI-A-1"

if [ $(hyprctl monitors | wc -l) -ge 2 ] && [ $(hyprctl monitors | grep $laptopScreen | wc -l) -ge 1 ]; then
    echo "It works"
	hyprctl keyword monitor $laptopScreen,disable
	hyprctl keyword monitor $extScreen,highrr,0x0,1
else
	hyprctl keyword monitor ,preferred,auto,1
fi
