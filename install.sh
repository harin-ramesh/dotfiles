#!/bin/bash

CURRENT_DIR=$(pwd)
CONFIG_PATH="$CURRENT_DIR/.conf"

# Safe symlink creator
link() {
    src="$1"
    dest="$2"

    # If destination is a symlink and correct, skip
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "OK: $dest already -> $src"
        return
    fi

    # If destination exists but is wrong, remove it
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Removing old $dest"
        rm -rf "$dest"
    fi

    echo "Linking: $dest -> $src"
    ln -s "$src" "$dest"
}

##############################
# USER CONFIG SYMLINKS
##############################

link "$CONFIG_PATH/nvim"           "$HOME/.config/nvim"
link "$CONFIG_PATH/kitty"          "$HOME/.config/kitty"
link "$CONFIG_PATH/yazi"           "$HOME/.config/yazi"
link "$CONFIG_PATH/i3"             "$HOME/.config/i3"
link "$CONFIG_PATH/rofi"           "$HOME/.config/rofi"
link "$CONFIG_PATH/polybar"        "$HOME/.config/polybar"
link "$CONFIG_PATH/picom"          "$HOME/.config/picom"
link "$CONFIG_PATH/fish"           "$HOME/.config/fish"
link "$CONFIG_PATH/starship.toml"  "$HOME/.config/starship.toml"
link "$CONFIG_PATH/wezterm"        "$HOME/.config/wezterm"

link "$CURRENT_DIR/.tmux.conf"     "$HOME/.tmux.conf"

##############################
# ROOT CONFIG SYMLINKS
##############################

# Create necessary directories
sudo mkdir -p /root/.config
sudo mkdir -p /root/.local/share
sudo mkdir -p /root/.local/state
sudo mkdir -p /root/.cache

# Run link() inside sudo context
sudo bash -c "$(declare -f link); link \"/home/$USER/.config/nvim\" \"/root/.config/nvim\""
sudo bash -c "$(declare -f link); link \"/home/$USER/.local/share/nvim\" \"/root/.local/share/nvim\""
sudo bash -c "$(declare -f link); link \"/home/$USER/.local/state/nvim\" \"/root/.local/state/nvim\""
sudo bash -c "$(declare -f link); link \"/home/$USER/.cache/nvim\" \"/root/.cache/nvim\""

echo "Install complete."
