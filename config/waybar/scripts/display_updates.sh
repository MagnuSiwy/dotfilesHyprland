#!/bin/bash

is_yay_installed=$(pacman -Q yay | grep error)
pacman_updates=$(checkupdates | wc -l)

if [ $pacman_updates -ge 1 ]; then
    echo "Pacman updates:"
    checkupdates
    echo ""
fi

if [ -n $is_yay_installed ]; then
    yay_updates=$(yay -Qau | wc -l)

    if [ $yay_updates -ge 1 ]; then 
        echo "AUR updates:"
        yay -Qau
        echo ""
    fi
fi
