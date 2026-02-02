#!/bin/bash

NOTIFIED_20=0
NOTIFIED_10=0
NOTIFIED_5=0

while true; do
    # Get current battery percentage (strip % sign)
    PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [[ "$STATUS" == "Discharging" ]]; then
        if [[ "$PERCENT" -le 20 && "$NOTIFIED_20" -eq 0 ]]; then
            notify-send "⚠️ Battery low" "Battery is at $PERCENT%"
            NOTIFIED_20=1
        fi
        if [[ "$PERCENT" -le 10 && "$NOTIFIED_10" -eq 0 ]]; then
            notify-send "⛔ Critical Battery" "Battery is at $PERCENT%. Plug in charger!"
            NOTIFIED_10=1
        fi
        if [[ "$PERCENT" -le 5 && "$NOTIFIED_5" -eq 0 ]]; then
            notify-send "❗ Dangerously Low" "Battery is at $PERCENT%. Shutting down soon!"
            NOTIFIED_5=1
        fi
    else
        # Reset notifications if charging or full
        NOTIFIED_20=0
        NOTIFIED_10=0
        NOTIFIED_5=0
    fi

    sleep 60
done

