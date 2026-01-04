#!/usr/bin/env bash
# Toggle Waybar visibility via CSS

WAYBAR_DIR="$HOME/.config/waybar"
CSS="$WAYBAR_DIR/style.css"
HIDDEN="$WAYBAR_DIR/style.hidden.css"

# Determine which CSS is currently active
CURRENT=$(readlink -f "$CSS")

if [ "$CURRENT" = "$HIDDEN" ]; then
    # Switch to normal CSS
    ln -sf "$WAYBAR_DIR/style.default.css" "$CSS"
else
    # Switch to hidden CSS
    ln -sf "$HIDDEN" "$CSS"
fi

# Tell Waybar to reload CSS
pkill -SIGUSR1 waybar

