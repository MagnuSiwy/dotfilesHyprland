#! /bin/bash

# This script turns off the laptop screen if an external display is connected

laptopScreen=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | head -n 1)
extScreen=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | tail -n 1)

if [ $(hyprctl monitors all | grep Monitor | wc -l) -ge 2 ]; then
	hyprctl keyword monitor $extScreen,preferred,auto,1,mirror,$laptopScreen
else
	hyprctl keyword monitor $laptopScreen,preferred,auto,1
fi
