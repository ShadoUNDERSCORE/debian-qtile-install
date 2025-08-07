#!/bin/sh

xrandr --auto # Make Sure All Monitors are recognized

xrandr --output DP-0 --right-of DP-4 # Align Monitors Properly

# Start Audio Server
pipewire & 
pipewire-pulse &

picom --config ~/.config/picom/picom.conf & # Launch Picom Compositor

blueman-applet & # Start Bluetooth Applet in Tray

xset r rate 300 40 # Set Repeat Settings for Holding Down a Key

xcape -e 'Super_L=KP_Insert' # Map Super Left to Key Pad Insert for Qtile Mode Switching

xdotool key KP_Insert # Set to Commad Mode on startup

feh --bg-fill ~/Pictures/wallpapers/alien-planet.jpg & # Set Walpaper

