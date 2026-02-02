#!/usr/bin/env bash

ICON_CONNECTED="󰌘"
ICON_DISCONNECTED="󰈀"

# Find first ethernet interface starting with en or eth
IFACE=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^(en|eth)' | head -n1)

if [ -z "$IFACE" ]; then
    echo "$ICON_DISCONNECTED"
    exit 0
fi

STATE=$(cat /sys/class/net/"$IFACE"/operstate)

if [ "$STATE" = "up" ]; then
    echo "$ICON_CONNECTED"
else
    echo "$ICON_DISCONNECTED"
fi
