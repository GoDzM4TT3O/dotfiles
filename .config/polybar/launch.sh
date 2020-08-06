#!/usr/bin/env bash
# polybar launch script

# terminate already running bars
killall -q polybar

# terminate pulseaudio server and start it again
killall -q pulseaudio

# launch nord bar
echo "---" | tee -a /tmp/polybar-nord.log
pulseaudio --start && echo "Started pulseaudio" | tee -a /tmp/polybar-nord.log
polybar nord >> /tmp/polybar-nord.log 2>&1 & 

echo "Launched nord bar..."
