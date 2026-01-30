#!/usr/bin/env bash
# powermenu.sh - simple power menu for Hyprland

# Ensure wofi is installed
if ! command -v wofi >/dev/null 2>&1; then
  echo "wofi not found! Install it first."
  exit 1
fi

# Show menu
choice=$(printf "Shutdown\nReboot\nLogout\nLock" | wofi --show dmenu --prompt "Power Menu")

# Handle selection
case "$choice" in
Shutdown)
  systemctl poweroff
  ;;
Reboot)
  systemctl reboot
  ;;
Lock)
  sleep 0.1
  bash $HOME/nixOS-desktop/hypr/scripts/lock.sh
  ;;
Logout)
  hyprctl dispatch exit
  ;;
*)
  # do nothing if cancelled
  ;;
esac
