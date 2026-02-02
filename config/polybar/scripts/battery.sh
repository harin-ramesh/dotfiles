#!/bin/bash

# Get battery info
battery_info=$(acpi -b)

# Extract percentage and status
percentage=$(echo "$battery_info" | grep -oP '\d+%' | tr -d '%')
status=$(echo "$battery_info" | grep -oP 'Charging|Discharging|Full')

# Choose icon based on percentage
if [ "$status" = "Charging" ]; then
    icon="⚡"  # Charging bolt
elif [ "$status" = "Full" ]; then
    icon="🔋"  # Full battery
else
    if [ "$percentage" -ge 80 ]; then
        icon="🔋"
    elif [ "$percentage" -ge 60 ]; then
        icon="🔋"
    elif [ "$percentage" -ge 40 ]; then
        icon="🔋"
    elif [ "$percentage" -ge 20 ]; then
        icon="🔋"
    else
        icon="🪫"  # Low battery
    fi
fi

echo "$icon  $percentage%"

