setxkbmap it &						# Set X keyboard layout to "it"
xset r rate 400 50 &					# Increase keyboard speed
picom -b &						# Transparency
xset dpms 600 &						# Energy star
unclutter --idle 3 --ignore-scrolling --jitter 25x25 &	# Hide the mouse automatically if it's not being used
~/.config/scripts/randomwall-now			# Set a random wallpaper
copyq &							# Clipboard Daemon
nm-applet &						# NetworkManager Applet

# Automatically lock the screen if not used for more than 10 minutes
#xautolock -time 10 -detectsleep -locker 'slock -m "Locked at $(date "+%a %d, %H:%M:%S") $(printf "\nRandom quote: \n") $(fortune)"' &
xscreensaver -no-splash &

# Adjust speaker sound levels
amixer -qD pulse sset Master 60% &
amixer -qD pulse sset Master mute &

# Adjust microphone sound levels
amixer -qD pulse sset Capture 60% &
amixer -qD pulse sset Capture mute &

# Support for pam-gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket) 
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass3 
eval $(ssh-agent -s) 
ssh-add 

# Set webcam brightness
v4l2-ctl --set-ctrl brightness=35 &
