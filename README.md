TERMINAL
Terminal: kitty
Terminal color scheme: Nord
Terminal font: Fira Code
Terminal config creator: kitty-cat
Terminal clock: tty-clock
Bash prompt: powerline
Terminal startup script: shell-color-scripts

SHELL-COLOR-SCRIPTS
Installation instructions:
git clone https://gitlab.com/dwt1/shell-color-scripts
cd shell-color-scripts
rm -rf /opt/shell-color-scripts || return 1
sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
sudo cp colorscript.sh /usr/bin/colorscript
# If you use zsh:
sudo cp zsh_completion/_colorscript /usr/share/zsh/site-functions

WM
Window Manager: i3
Status bar: i3status
Status bar font: FontAwesome
Lock screen: i3lock

MUSIC
Music player: CMus
Music visualizer: cli-visualizer

VIM
Text editor: Vim
Vim color scheme: deus
Vim package managers: vim-plug, vim-pathogen
Vim status bar: vim-airline

INSTALLATION
Get i3:
Debian/Mint/Ubuntu: `sudo apt install i3`
Arch Linux/Manjaro: `sudo pacman -S i3`
The packages that need to be installed are: `i3-wm dunst i3lock i3status suckless-tools`. If they aren't automatically installed, install them.

Install additional packages:
Debian/Mint/Ubuntu: `sudo apt install compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior feh kitty`
Arch Linux/Manjaro: `sudo pacman -S compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior feh kitty`

COPYING CONFIGURATIONS
`git clone https://github.com/GoDzM4TT3O/dotfiles` # clone the repo
`cd dotfiles` # go into the dotfiles directory
`cp -rf .* ~` # this will copy all of the dotfiles 

MODIFYING CONFIGURATIONS
You should modify `~/.config/i3status/config`, because it contains network interfaces that might be different from yours.
Change `wlp4s0` and `enp2s0` with your network interfaces.
You can find yours by running the command ip link | grep -oE "^[2-9]: [e-w].....", then you will likely have two results.
My results are "2: enp3s0" and "3: wlp4s0". You need to copy the interface names (after the number and the colon) respectively over the existing interfaces.
For example, if your results are "2: eth0" and "3: wlan0", replace "enp3s0" with "eth0", and "wlp4s0" with "wlan0".

I also removed CPU temperature from the i3bar. To add it back, replace "~/.config/i3status/config" with the lines below:

```
general {
        output_format = "i3bar"
        colors = false
        markup = pango
        interval = 5
        color_good = '#2f343f'
                color_degraded = '#ebcb8b'
                color_bad = '#ba5e57'
}

order += "cpu_temperature 0"
order += "load"
order += "disk /"
order += "ethernet enp3s0"
order += "wireless wlp4s0"
order += "volume master"
order += "battery 1"
order += "tztime local"

cpu_temperature 0 {
	format = "<span background='#ff5555'>  </span><span background='#e5e9f0'> %degrees °C </span>"
        path = "/sys/class/thermal/thermal_zone0/temp"
}

load {
        format = "<span background='#f59335'>  %5min Load </span>"
}

disk "/" {
        format = "<span background='#fec7cd'>  %free Free </span>"
}

memory {
        format = "%used"
        threshold_degraded = "10%"
        format_degraded = "MEMORY: %free"
}

ethernet enp2s0 {
	format_up = "<span background='#88c0d0'>  %ip </span>"
        format_down = "<span background='#88c0d0'>  Disconnected </span>"
}

wireless wlp4s0 {
        format_up = "<span background='#b48ead'>  %essid </span>"
        format_down = "<span background='#b48ead'>  Disconnected </span>"
}

volume master {
        format = "<span background='#ebcb8b'>  %volume </span>"
        format_muted = "<span background='#ebcb8b'>  Muted </span>"
        device = "default"
        mixer = "Master"
        mixer_idx = 0
}

battery 1 {
        last_full_capacity = true
        format = "<span background='#a3be8c'> %status %percentage </span>"
        format_down = "  No Battery"
        status_chr = "  Charging"
        status_bat = "  Battery"
        status_unk = "  Unknown"
        status_full = "  Charged"
        path = "/sys/class/power_supply/BAT%d/uevent"
        low_threshold = 10
}

tztime local {
                format = "<span background='#81a1c1'> %time </span>"
                format_time = " %a %-d %b %H:%M"
}

```

Make sure to replace the network interfaces.
