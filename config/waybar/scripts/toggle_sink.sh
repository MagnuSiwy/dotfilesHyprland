#!/bin/bash

DEFAULT_SINK=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk 'NR==1 {print $2}' | cut -c 1-2)
AVAILABLE_SINKS=$(wpctl status | awk '/Sinks:/ {found=1;next} /Sources:/ {found=0} found {print $2}' | grep -G '[0-9][0-9]\.' | cut -c 1-2)


for sink in $AVAILABLE_SINKS; do
    echo "Checking $sink"
    if [ $sink -gt $DEFAULT_SINK ]; then
        # echo $sink
        wpctl set-default $sink
    else
        continue
    fi

    if [ $sink -eq $(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk 'NR==1 {print $2}' | cut -c 1-2) ]; then
        # echo $sink
        exit 0
    fi
done

if [ $DEFAULT_SINK -eq $(wpctl inspect @DEFAULT_AUDIO_SINK@ | awk 'NR==1 {print $2}' | cut -c 1-2) ]; then
    # echo "Falling back to the first sink"
    wpctl set-default $(echo "$AVAILABLE_SINKS" | head -n 1)
fi;
