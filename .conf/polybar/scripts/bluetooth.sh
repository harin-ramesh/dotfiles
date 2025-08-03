#!/bin/sh

ICON=""  # Bluetooth symbol
DISABLED_ICON="󰂲"  # A 'turned off' or 'disabled' icon (Nerd Font)

# Check if Bluetooth is powered on
if ! bluetoothctl show | grep -q "Powered: yes"; then
  echo "$DISABLED_ICON"
  exit
fi

# Get connected device name (if any)
DEVICE_NAME=$(bluetoothctl info | grep "Name:" | awk '{$1=""; print $0}' | sed 's/^ *//')

if [ -z "$DEVICE_NAME" ]; then
  echo "$ICON"  # Bluetooth on, not connected
else
  INITIAL=$(echo "$DEVICE_NAME" | cut -c1)
  echo "$ICON $INITIAL…"
fi
