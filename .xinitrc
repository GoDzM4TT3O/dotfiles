setxkbmap it &						# Set X keyboard layout to "it"
xset r rate 400 50 &					# Increase keyboard speed
picom -b &						# Transparency
xset dpms 600 &						# Energy star
unclutter --idle 3 --ignore-scrolling --jitter 25x25 &	# Hide the mouse automatically if it's not being used
~/.config/scripts/randomwall-now			# Set a random wallpaper
copyq &							# Clipboard Daemon

# Automatically lock the screen if not used for more than 10 minutes
xautolock -time 10 -detectsleep -locker 'slock -m "Locked at $(date "+%a %d, %H:%M:%S") $(printf "\nRandom quote: ") $(fortune)"' &

# Un-mute the speaker if it's muted
[ $(amixer | head -n7 | grep -o "\[off\]") ] && amixer -qD pulse sset Master unmute
