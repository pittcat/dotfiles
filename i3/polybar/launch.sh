#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload kobra &
  done
else
  polybar --reload kobra &

fi
  
# [bar/bar]

# font-0 = "Overpass Mono:pixelsize=10;2.25"

# monitor = ${env:MONITOR:}


