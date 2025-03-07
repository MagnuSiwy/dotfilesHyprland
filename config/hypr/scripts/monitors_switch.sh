#! /bin/bash

# This script switches between laptop screen and one external monitor or between external monitors

monitors=($(hyprctl monitors all | grep Monitor | awk '{print $2}'))
num_monitors=$(hyprctl monitors all | grep Monitor | wc -l)
active_monitor=$(hyprctl monitors all | grep -B 11 "focused: yes" | head -n 1 | awk '{print $2}')

laptop=${monitors[0]}
ext1=${monitors[1]:-}
ext2=${monitors[2]:-}

if [ "$num_monitors" -eq 2 ]; then
    if [ "$active_monitor" = "$ext1" ]; then
        echo "$ext1 to $laptop"
        hyprctl keyword monitor $laptop,preferred,auto,1
        hyprctl keyword monitor $ext1,disable
    else
        echo "$laptop to $ext1"
        hyprctl keyword monitor $laptop,disable
        hyprctl keyword monitor $ext1,highrr,auto,1
    fi
elif [ "$num_monitors" -ge 3 ]; then
    hyprctl keyword monitor $laptop,disable
    if [ "$active_monitor" = "$ext1" ]; then
        echo "$ext1 to $ext2"
        hyprctl keyword monitor $ext1,disable
        hyprctl keyword monitor $ext2,highrr,auto,1
    else
        echo "$ext2 to $ext1"
        hyprctl keyword monitor $ext2,disable
        hyprctl keyword monitor $ext1,preferred,auto,1
    fi
else
	hyprctl keyword monitor $laptop,preferred,auto,1
fi
