#!/usr/bib/env bash

# live home wallpaper blur
grim -g "$(hyprctl activewindowgeometry | awk '{print $2,$3,$4,$5}')" /tmp/lock.png

swaylock-effects \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 110 \
  --indicator-thickness 6 \
  --ring-color d97742 \
  --key-hl-color 9bb39b \
  --inside-color 1e1b18dd \
  --text-color e6e1dc \
  --fade-in 0.3 \
  --effect-blur 7x5 \
  --effect-vignette 0.4:0.4
