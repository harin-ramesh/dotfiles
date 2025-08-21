#!/bin/bash

HDMI_OUTPUT=$(xrandr | grep " connected" | grep "HDMI" | cut -d ' ' -f1)

if [ -n "$HDMI_OUTPUT" ]; then
    i3-msg "workspace 1; move workspace to output $HDMI_OUTPUT"
else
    i3-msg "workspace 1; move workspace to output eDP-1"
fi
