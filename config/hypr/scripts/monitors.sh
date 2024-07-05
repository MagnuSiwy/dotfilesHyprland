#! /bin/bash

if [ $(hyprctl monitors | grep Monitor | wc -l) -ge 2 ]; then
	hyprctl dispatch swapactiveworkspaces eDP-1 HDMI-A-1
	wlr-randr --output eDP-1 --off
#	hyprctl keyword monitor "eDP-1, disable"
#	hyprctl keyword monitor "HDMI-A-1, 1920x1080@144, 0x0, 1"
else
	hyprctl dispatch swapactiveworkspaces eDP-1 HDMI-A-1
	wlr-randr --output eDP-1 --on
#	hyprctl keyword monitor "eDP-1, preferred, auto, 1"
#	hyprctl keyword monitor "HDMI-A-1, disable"
fi
