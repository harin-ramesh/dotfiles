#!/bin/bash

# Turn on Bluetooth
echo "Turning on Bluetooth..."
echo -e "power on\npairable on\ndiscoverable on\n" | bluetoothctl

# Scan for nearby devices
echo "Scanning for nearby Bluetooth devices for 10 seconds..."
DEVICES=()
echo -e "scan on\n" | bluetoothctl &
SCAN_PID=$!
sleep 10
kill $SCAN_PID
echo "Scan finished."

# Get list of devices (name + MAC)
mapfile -t DEVICES < <(bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}')

# Check if any devices found
if [ ${#DEVICES[@]} -eq 0 ]; then
    echo "No devices found."
    exit 1
fi

# List devices with index
echo "Available devices:"
for i in "${!DEVICES[@]}"; do
    echo "[$i] ${DEVICES[$i]}"
done

# Ask user to select a device
read -p "Enter the index of the device to connect: " INDEX

# Validate input
if ! [[ "$INDEX" =~ ^[0-9]+$ ]] || [ "$INDEX" -ge "${#DEVICES[@]}" ]; then
    echo "Invalid index."
    exit 1
fi

# Extract MAC address
DEVICE_MAC=$(echo "${DEVICES[$INDEX]}" | awk '{print $1}')

# Pair, trust, and connect
echo "Pairing with $DEVICE_MAC..."
echo -e "pair $DEVICE_MAC\ntrust $DEVICE_MAC\nconnect $DEVICE_MAC\n" | bluetoothctl

echo "Done!"

