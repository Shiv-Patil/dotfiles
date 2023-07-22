#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars
if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    polybar --reload --config=$HOME/.config/polybar/config.ini $m 2>&1 | tee -a /tmp/polybarlaunch.log & disown
  done
else
  polybar --reload --config=$HOME/.config/polybar/config.ini example 2>&1 | tee -a /tmp/polybarlaunch.log & disown
fi

# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
