#!/bin/bash

# Check if nmcli is installed
if ! command -v nmcli &> /dev/null; then
    echo "nmcli command not found. Please install NetworkManager."
    exit 1
fi

# List available Wi-Fi networks
echo "Scanning for Wi-Fi networks..."
mapfile -t NETWORKS < <(nmcli -t -f SSID,SIGNAL dev wifi list | awk -F: '{print $1 " (" $2 "%)"}')

# Check if any networks found
if [ ${#NETWORKS[@]} -eq 0 ]; then
    echo "No Wi-Fi networks found."
    exit 1
fi

# Display networks with index
echo "Available Wi-Fi networks:"
for i in "${!NETWORKS[@]}"; do
    echo "[$i] ${NETWORKS[$i]}"
done

# Ask user to select a network
read -p "Enter the index of the Wi-Fi network to connect: " INDEX

# Validate input
if ! [[ "$INDEX" =~ ^[0-9]+$ ]] || [ "$INDEX" -ge "${#NETWORKS[@]}" ]; then
    echo "Invalid index."
    exit 1
fi

# Extract SSID
SSID=$(echo "${NETWORKS[$INDEX]}" | awk '{print $1}')

# Ask for password
read -s -p "Enter Wi-Fi password (leave empty for open network): " PASSWORD
echo

# Connect to Wi-Fi
if [ -z "$PASSWORD" ]; then
    nmcli dev wifi connect "$SSID"
else
    nmcli dev wifi connect "$SSID" password "$PASSWORD"
fi

echo "Done!"

