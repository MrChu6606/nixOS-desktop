#!/usr/bin/env bash

# live home wallpaper capture incase you dont want blurred
#geom=$(hyprctl activewindowgeometry | awk '{print $4 "x" $5 "+" $3}')
#grim -g "$geom" /tmp/lock.png

swaylock \
  --screenshots \
  --clock \
  --indicator \
  --indicator-radius 110 \
  --indicator-thickness 6 \
  --effect-blur 7x5 \
  --effect-vignette 0.5:0.5 \
  --ring-color d97742 \
  --key-hl-color 9bb39b \
  --line-color 00000000 \
  --inside-color 1e1b18dd \
  --text-color e6e1dc \
  --grace 2 \
  --fade-in 0.1
