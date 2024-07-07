#! /bin/bash

if [ $(hyprctl monitors | grep Monitor | wc -l) -ge 2 ]; then
	hyprctl keyword monitor eDP-1,disable
	hyprctl keyword monitor HDMI-A-1,1920x1080@144,0x0,1
else
	hyprctl keyword monitor eDP-1,1920x1080@120,0x0,1
	hyprctl keyword monitor HDMI-A-1,disable
fi

hyprctl dispatch workspace 1
