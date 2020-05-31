#!/bin/bash

# get a list of batteries
for battery in /sys/class/power_supply/BAT?
do
	# get various information: capacity (%), status (charging/discharging/unknown), battery name.
	# get capacity
	capacity=$(cat "$battery"/capacity)
	# get the current battery status (charging/discharging)
	status=$(cat "$battery"/status)
	# get only the name of the battery
	batteryname=$(echo $battery | grep -Eo "BAT[0-9]")

	[[ $status = "Discharging" || $status = "Unknown" ]] && \
	# if capacity is less than 10% and the battery isn't charging, send a notification
	[[ $capacity < 10 ]] && /usr/bin/notify-send -u critical "Battery $batteryname charge very low  " "Please charge battery $batteryname, its capacity is $capacity%." || \
	
	# if capacity is less than 20% and the battery isn't charging, send a notification
	[[ $capacity < 20 ]] && /usr/bin/notify-send -u critical "Battery $batteryname charge low " "Please charge battery $batteryname, its capacity is $capacity%."
	
done
