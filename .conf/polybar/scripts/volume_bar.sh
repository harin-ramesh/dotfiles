#!/bin/bash
# Get volume and mute status
VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)
BAR_WIDTH=20

# Clamp volume at 100
if [ "$VOLUME" -gt 100 ]; then
    VOLUME=100
fi

# Round volume down to nearest multiple of 5
VOLUME=$(( (VOLUME / 5) * 5 ))

if [ "$MUTED" = "true" ]; then
    echo "%{T2}🔇%{T-} [$(printf '░%.0s' $(seq 1 $BAR_WIDTH))] muted"
    exit
fi

# Calculate number of blocks to fill
FILLED=$((VOLUME * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))
FILLED_BAR=$(printf '█%.0s' $(seq 1 $FILLED))
EMPTY_BAR=$(printf '░%.0s' $(seq 1 $EMPTY))

# Print final bar with clamped volume
printf "%s [%s%s] %3d%%\n" "%{T2}🔊%{T-}" "$FILLED_BAR" "$EMPTY_BAR" "$VOLUME"
