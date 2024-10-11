#!/bin/bash

is_yay_installed=$(pacman -Q yay | grep error)
pacman_updates=$(checkupdates | wc -l)

if [ -n $is_yay_installed ]; then
    yay_updates=$(yay -Qau | wc -l)

    if [ $pacman_updates -ge 1 ] && [ $yay_updates -ge 1 ]; then 
        echo " $pacman_updates   $yay_updates"
    elif [ $pacman_updates -ge 1 ] && [ $yay_updates -lt 1 ]; then
        echo " $pacman_updates"
    elif [ $pacman_updates -lt 1 ] && [ $yay_updates -ge 1 ]; then
        echo " $yay_updates"
    else
        echo ""
    fi
else
    if [ $pacman_updates -ge 1 ]; then 
        echo " $pacman_updates"
    else
        echo ""
    fi
fi
