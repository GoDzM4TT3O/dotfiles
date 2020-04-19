# My dotfiles
## Preview
Kitty
![ws2](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws2.png)

Three kitty terminals
![ws3](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws3.png)

Htop, cmus and cli-visualizer
![ws4](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws4.png)

***

## Terminal
- Terminal: `kitty`
- Terminal color scheme: [Nord](http://nordtheme.com/)
- Terminal font: [Fira Code](https://github.com/tonsky/FiraCode)
- Terminal config creator: [kitty-cat](https://github.com/adi1090x/kitty-cat)

NOTE: I installed Nord Theme and Fira Code for `kitty` using kitty-cat. There is no need to install kitty-cat again, as the config is already created.

- Terminal clock: `tty-clock`
- Bash prompt: [powerline](https://github.com/powerline/powerline)
- Terminal startup script: [shell-color-scripts](https://gitlab.com/dwt1/shell-color-scripts)
- Get system info: `neofetch`

## shell-color-scripts
Installation instructions:

```bash
git clone https://gitlab.com/dwt1/shell-color-scripts`
cd shell-color-scripts
rm -rf /opt/shell-color-scripts || return 1
sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
sudo cp colorscript.sh /usr/bin/colorscript
# If you use zsh:
sudo cp zsh_completion/_colorscript /usr/share/zsh/site-functions
```

## WM
- Window Manager: `i3`
- Status bar: `i3bar`
- Status bar font: [FontAwesome](https://github.com/fontawesome/fontawesome)
- Lock screen: `i3lock`

## Image viewer
- Image viewer: `feh`

## Music
- Music player: `cmus`
- Music visualizer: [cli-visualizer](https://github.com/dpayne/cli-visualizer)

NOTE: to launch cli-visualizer, run `vis`

## Vim
- Text editor: `vim`
- Vim color scheme: deus
- Vim package managers: vim-plug, vim-pathogen
- Vim status bar: vim-airline

PLEASE see [readme.txt inside .vim](https://github.com/godzm4tt3o/dotfiles/blob/master/.vim/readme.txt)

***

## Installation
Get i3:
- Debian/Mint/Ubuntu: `sudo apt install i3`
- Arch Linux/Manjaro: `sudo pacman -S i3`

The packages that need to be installed are: `i3-wm dunst i3lock i3status`.
If they aren't automatically installed, install them.

Install additional packages:
- Debian/Mint/Ubuntu: `sudo apt install git compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior feh kitty tty-clock`
- Arch Linux/Manjaro: `sudo pacman -S git compton hsetroot rxvt-unicode xsel rofi xsettingsd lxappearance scrot viewnior feh kitty`

## Copying configurations
```
git clone https://github.com/GoDzM4TT3O/dotfiles # clone the repo
cd dotfiles # go into the dotfiles directory
cp -rf .* ~ # this will copy all of the dotfiles into /home/$USER
```

## Modifying configurations
You should modify `~/.config/i3status/config`, because it contains network interfaces that might be different from yours.
Change `wlp4s0` and `enp2s0` with your network interfaces.
You can find yours by running the command `ip link | grep -oE "^[2-9]: [e-w]....."`, then you will likely have two results.
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
