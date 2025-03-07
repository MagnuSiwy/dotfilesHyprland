#! /bin/bash

# This script turns off the laptop screen if an external display/s is/are connected

laptop=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | head -n 1)
monitor=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | head -n 2 | tail -n 1)
tv=$(hyprctl monitors all | grep Monitor | awk '{print $2}' | tail -n 1)

if [ $(hyprctl monitors all | grep Monitor | wc -l) -eq 2 ]; then    
    hyprctl keyword monitor $laptop,disable
    hyprctl keyword monitor $monitor,highrr,0x0,1
    hyprctl keyword monitor $tv,disable
elif [ $(hyprctl monitors all | grep Monitor | wc -l) -ge 3 ]; then    
    hyprctl keyword monitor $laptop,disable
    hyprctl keyword monitor $monitor,disable
    hyprctl keyword monitor $tv,preferrable,0x0,1
else
	hyprctl keyword monitor $laptopScreen,preferred,auto,1
fi
