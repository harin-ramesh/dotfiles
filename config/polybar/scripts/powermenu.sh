#!/bin/bash

# Options
shutdown="⏻ Shutdown"
reboot=" Reboot"
lock=" Lock"
suspend=" Suspend"
logout="󰍃 Logout"
cancel="󰜺 Cancel"

# Rofi CMD
rofi_cmd="rofi -dmenu -p Power -theme ~/.config/rofi/catppuccin-mocha.rasi"

# Show options
chosen="$(printf '%s\n' "$lock" "$suspend" "$logout" "$reboot" "$shutdown" "$cancel" | $rofi_cmd)"

case "$chosen" in
  "$shutdown") systemctl poweroff ;;
  "$reboot") systemctl reboot ;;
  "$lock") i3lock -c 000000 ;;
  "$suspend") systemctl suspend ;;
  "$logout") i3-msg exit ;;
  *) exit 0 ;;
esac

