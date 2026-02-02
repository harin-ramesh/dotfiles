#!/bin/bash

CURRENT_DIR=$(pwd)
CONFIG_PATH="$CURRENT_DIR/config"
HOME_PATH="$CURRENT_DIR/home"
TEMPLATES_PATH="$CURRENT_DIR/templates"

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
# XDG CONFIG SYMLINKS (~/.config/)
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

##############################
# HOME DOTFILE SYMLINKS (~/)
##############################

link "$HOME_PATH/.tmux.conf"       "$HOME/.tmux.conf"
link "$HOME_PATH/.gitconfig"       "$HOME/.gitconfig"

##############################
# TEMPLATES (copied, not symlinked)
##############################

# Create .gitconfig.local from template with user-provided values
if [ -f "$HOME/.gitconfig.local" ]; then
    echo "OK: $HOME/.gitconfig.local already exists, skipping"
else
    echo ""
    echo "Setting up Git user config (~/.gitconfig.local)..."
    read -rp "  Git author name: " git_name
    read -rp "  Git author email: " git_email
    sed -e "s/^    name = .*/    name = $git_name/" \
        -e "s/^    email = .*/    email = $git_email/" \
        "$TEMPLATES_PATH/.gitconfig.local" > "$HOME/.gitconfig.local"
    echo "Created: $HOME/.gitconfig.local"
fi

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
