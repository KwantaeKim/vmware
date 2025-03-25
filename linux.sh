#!/bin/bash

# Set the keyboard layout to US International with dead keys
set_layout="us intl"

# Use localectl to set the keyboard layout for the X11 environment
sudo localectl set-x11-keymap us intl

# Confirm the layout change
echo "Keyboard layout has been set to US International with dead keys."

# Optional: Set layout in GNOME for immediate effect without restarting
# Use gsettings to apply the layout if you are using GNOME-based desktop environments
gsettings set org.gnome.desktop.input-sources sources "[('xkb', '$set_layout')]"

# Optional: Restart the GNOME Shell to apply changes immediately
# Uncomment the line below if you find the layout doesn’t apply immediately
# (Only for GNOME, not necessary for other desktop environments)
# gnome-shell --replace & disown

echo "Keyboard layout change applied in GNOME as well."
