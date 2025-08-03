#!/bin/bash

# i3 Window Manager Setup - Dependency Installer

echo "🔧 Installing i3wm and common utilities..."

# 🪟 i3 - a tiling window manager
sudo apt install -y i3

# 🖼️ feh - image viewer, used for setting wallpapers
sudo apt install -y feh

# 🔍 rofi - app launcher and window switcher
sudo apt install -y rofi

# 📊 polybar - better status bar
sudo apt install -y polybar

# 💨 picom - compositor for transparency, shadows, etc.
sudo apt install -y picom

# 🎙️ pulseaudio-utils - needed for mic mute/unmute scripts
sudo apt install -y pulseaudio-utils

# 🔐 i3lock-fancy - screen locker
sudo apt install -y i3lock-fancy

# 📸 flameshot - screenshot tool
sudo apt install -y flameshot

# 🔔 dunst - notification daemon
sudo apt install -y dunst

# 📨 libnotify-bin - for notify-send command
sudo apt install -y libnotify-bin

echo "✅ All dependencies installed."

