CURRENT_DIR=$(pwd)
CONFIG_PATH="$CURRENT_DIR/.conf/"

ln -sf "$CONFIG_PATH/nvim" ~/.config/nvim
ln -sf "$CONFIG_PATH/kitty" ~/.config/kitty
ln -sf "$CONFIG_PATH/yazi" ~/.config/yazi
ln -sf "$CONFIG_PATH/starship.toml" ~/.config/starship.toml

ln -sf "$CURRENT_DIR/.tmux.conf" ~/.tmux.conf
