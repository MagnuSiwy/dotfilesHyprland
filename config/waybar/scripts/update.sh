#!/bin/bash

is_yay_installed=$(pacman -Q yay | grep error)

if [ -n $is_yay_installed ]; then
    echo "Updating with yay"
    yay -Syu
else
    echo "Updating with pacman"
    sudo pacman -Syu
fi
