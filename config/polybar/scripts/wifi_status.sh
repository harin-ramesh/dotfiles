#!/bin/bash

# Get current Wi-Fi connection
wifi_info=$(nmcli -t -f active,ssid,signal dev wifi | grep '^yes')

if [ -z "$wifi_info" ]; then
    # Not connected
    echo "󰤮  Disconnected"
else
    # Connected: Parse SSID and Signal
    ssid=$(echo "$wifi_info" | cut -d':' -f2)
    signal=$(echo "$wifi_info" | cut -d':' -f3)

    # Choose icon based on signal strength
    if [ "$signal" -ge 80 ]; then
        icon="󰤨 "
    elif [ "$signal" -ge 60 ]; then
        icon="󰤥 "
    elif [ "$signal" -ge 40 ]; then
        icon="󰤢 "
    elif [ "$signal" -ge 20 ]; then
        icon="󰤟 "
    else
        icon="󰤯 "
    fi
    echo "$icon  $ssid"
fi
