#!/usr/bin/env zsh

# Check if any screensaver kitty instances are already running
if pgrep -f 'kitty.*--title __screensaver__:' > /dev/null; then
  exit 0
fi

# No screensaver running — proceed to spawn per monitor
monitors=("${(@f)$(hyprctl monitors | grep 'Monitor' | awk '{print $2}')}")

for monitor in $monitors; do
  title="__screensaver__:$monitor"
  hyprctl dispatch exec "[monitor:$monitor] kitty --title $title -o background_opacity=1 -o background=black pipes.sh -p 10 -f 100"
done

sleep 3

hyprlock
