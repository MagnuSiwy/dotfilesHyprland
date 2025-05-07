#!/bin/bash

DEFAULT_SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk 'NR==1 {print $2}' | cut -c 1-2)
AVAILABLE_SINKS=$(wpctl status | awk '/Sinks:/ {found=1;next} /Sources:/ {found=0} found {print $2}' | grep -G '[0-9][0-9]\.' | cut -c 1-2)

echo "Start sink script"
for sink in $AVAILABLE_SINKS; do
    echo "Checking $sink"
    
    if [ $sink -gt $DEFAULT_SINK ]; then
        wpctl set-default $sink

        if [ $sink -eq $(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk 'NR==1 {print $2}' | cut -c 1-2) ]; then
            echo "Using $sink"
            exit 0 
        fi
    fi
done

echo "Using default $(echo "$AVAILABLE_SINKS" | head -n 1)"
wpctl set-default $(echo "$AVAILABLE_SINKS" | head -n 1)
