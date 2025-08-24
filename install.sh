CURRENT_DIR=$(pwd)
CONFIG_PATH="$CURRENT_DIR/.conf"

ln -sf "$CONFIG_PATH/nvim" ~/.config/nvim
ln -sf "$CONFIG_PATH/kitty" ~/.config/kitty
ln -sf "$CONFIG_PATH/yazi" ~/.config/yazi
ln -sf "$CONFIG_PATH/i3" ~/.config/i3
ln -sf "$CONFIG_PATH/rofi" ~/.config/rofi
ln -sf "$CONFIG_PATH/polybar" ~/.config/polybar
ln -sf "$CONFIG_PATH/picom" ~/.config/picom
ln -sf "$CONFIG_PATH/fish" ~/.config/fish
ln -sf "$CONFIG_PATH/starship.toml" ~/.config/starship.toml

ln -sf "$CURRENT_DIR/.tmux.conf" ~/.tmux.conf


# Create symlinks for Neovim configuration in root's home directory
sudo mkdir -p /root/.config
sudo ln -sf /home/$USER/.config/nvim /root/.config/nvim

sudo ln -sf /home/$USER/.local/share/nvim /root/.local/share/nvim
sudo ln -sf /home/$USER/.local/state/nvim /root/.local/state/nvim
sudo ln -sf /home/$USER/.cache/nvim /root/.cache/nvim
