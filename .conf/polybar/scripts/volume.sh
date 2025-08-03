#!/bin/bash

volume=$(pamixer --get-volume)
muted=$(pamixer --get-mute)

if [ "$muted" = "true" ]; then
    echo "󰝟  Muted"
else
    if [ "$volume" -ge 75 ]; then
        icon="󰕾"  # High
    elif [ "$volume" -ge 40 ]; then
        icon="󰖀"  # Medium
    elif [ "$volume" -ge 1 ]; then
        icon="󰕿"  # Low
    else
        icon="󰝟"  # Zero
    fi
    echo "$icon  $volume%"
fi

