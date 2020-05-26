#!/usr/bin/env bash
# polybar launch script

# terminate already running bars
killall -q polybar

# launch nord bar
echo "---" | tee -a /tmp/polybar-nord.log
polybar nord >> /tmp/polybar-nord.log 2>&1 &

echo "Launched nord bar..."
