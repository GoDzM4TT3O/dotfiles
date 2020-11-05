#!/usr/bin/env bash
# polybar launch script

setxkbmap it
loadkeys it

# terminate already running bars
killall -q polybar

# terminate pulseaudio server and start it again
killall -q pulseaudio

# launch dogrun bar
echo "---" | tee -a /tmp/polybar-dogrun.log
pulseaudio --start && echo "Started pulseaudio" | tee -a /tmp/polybar-dogrun.log
polybar dogrun >> /tmp/polybar-dogrun.log 2>&1 & 

echo "Launched dogrun bar..."
