gsettings set org.gnome.mutter overlay-key '' # diable workspace overview
# gsettings set org.gnome.mutter overlay-key -  to revert

gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
wmctrl -s <workspace index, start with 0> => create command with this command to navigate workspace
