#!/bin/bash

ACTION="$1"
MAX_VOLUME=200
NOTIF_ID=9991

get_volume() {
  pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1 | tr -d '%'
}

draw_bar() {
  local volume=$1
  local filled=$((volume / 5))
  local empty=$((20 - filled))
  local bar=$(printf '█%.0s' $(seq 1 $filled))
  bar+=$(printf '░%.0s' $(seq 1 $empty))
  echo "$bar"
}

case "$ACTION" in
  up)
    pactl set-sink-mute @DEFAULT_SINK@ 0  # Unmute if muted
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    vol=$(get_volume)
    if [ "$vol" -gt "$MAX_VOLUME" ]; then
      pactl set-sink-volume @DEFAULT_SINK@ ${MAX_VOLUME}%
      vol=$MAX_VOLUME
    fi
    bar=$(draw_bar $vol)
    notify-send -r $NOTIF_ID "🔊 Volume: ${vol}%" "$bar"
    ;;

  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    vol=$(get_volume)
    bar=$(draw_bar $vol)
    notify-send -r $NOTIF_ID "🔉 Volume: ${vol}%" "$bar"
    ;;

  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
    if [ "$muted" = "yes" ]; then
      notify-send -r $NOTIF_ID "🔇 Volume Muted"
    else
      vol=$(get_volume)
      bar=$(draw_bar $vol)
      notify-send -r $NOTIF_ID "🔊 Volume Unmuted: ${vol}%" "$bar"
    fi
    ;;

  mic)
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    mic_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')
    if [ "$mic_muted" = "yes" ]; then
      notify-send -r $NOTIF_ID "🎙️ Mic Muted"
    else
      notify-send -r $NOTIF_ID "🎙️ Mic Unmuted"
    fi
    ;;

  *)
    echo "Usage: $0 [up|down|mute|mic]"
    exit 1
    ;;
esac
