#!/bin/bash

rofi -config $HOME/.i3/rofi-config -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}'
sleep 0.5

# Capture the selection
TEXT="$( xclip -o -selection clipboard )"

# Only attempt to paste if there has been selection
if [ "${TEXT}x" != "x" ]; then
  xdotool type "$TEXT"

  # clear selection on paste
  echo "" | xclip -selection clipboard
fi
