#!/bin/bash

# ICON_MUTED="󰍬"
# ICON_UNMUTED="󰍭"

ICON_UNMUTED=""
ICON_MUTED=""

SOURCE=$(pactl info | grep 'Default Source' | awk '{print $3}')
if [ -z "$SOURCE" ]; then
    echo ""  # fallback symbol
    exit
fi

MUTED=$(pactl get-source-mute "$SOURCE" | awk '{print $2}')
if [ "$MUTED" = "yes" ]; then
    echo "$ICON_MUTED"
else
    echo "$ICON_UNMUTED"
fi

