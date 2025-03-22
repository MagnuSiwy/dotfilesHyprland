#! /bin/bash

# This script turns off the laptop screen if an external display/s is/are connected

monitors=($(hyprctl monitors all | grep Monitor | awk '{print $2}'))
num_monitors=$(hyprctl monitors all | grep Monitor | wc -l)

laptop=${monitors[0]}
ext1=${monitors[1]:-}
ext2=${monitors[2]:-}

if [ "$num_monitors" -eq 2 ]; then    
    hyprctl keyword monitor $laptop,disable
    hyprctl keyword monitor $ext1,preferred,auto,1
elif [ "$num_monitors" -ge 3 ]; then    
    hyprctl keyword monitor $laptop,disable
    hyprctl keyword monitor $ext1,disable
    hyprctl keyword monitor $ext2,highrr,auto,1
else
	hyprctl keyword monitor $laptop,preferred,auto,1
fi

hyprctl dispatch workspace 1

sleep 1
pkill waybar
waybar &
