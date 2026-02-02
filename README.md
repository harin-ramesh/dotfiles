# dotfiles

My configs.

**Includes:** neovim, i3wm, polybar, tmux, kitty, wezterm, fish, rofi, picom, starship, yazi, git, delta.

## Install

```bash
git clone https://github.com/harin-ramesh/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

For i3 desktop dependencies:

```bash
./scripts/i3wm_setup_dependencies.sh
```

## Structure

```
config/     -> ~/.config/*
home/       -> ~/*
scripts/    -> setup scripts
templates/  -> copied on install
```
