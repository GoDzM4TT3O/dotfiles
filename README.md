# GoDzM4TT3O's dotfiles
## Sections:
- [Sections](#sections)
- [Previews](#previews)
- [Others (not included)](#others-not-included)
- [Terminal](#terminal)
- [Terminal addons](#terminal-addons)
	- [Vifm](#vifm)
	- [Powerline](#powerline)
	- [Shell Color Scripts](#shell-color-scripts)
- [Window Manager](#window-manager)
- [Window Manager addons](#window-manager-addons)
	- [Screen Saver](#xscreensaver)
	- [Automatic lock](#xautolock)
- [Extras](#extras)
	- [Image Viewer](#image-viewer)
	- [Music](#music)
	- [Text editor](#text-editor)
- [Installation](#installation)
	- [Copying the configurations](#copying-configurations)
	- [Modifying the configurations](#modifying-configurations)


***

## Previews
Kitty
![ws2](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws2.png)

Three kitty terminals
![ws3](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws3.png)

Htop, cmus and cli-visualizer
![ws4](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/ws4.png)

Floating layout
![floating](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/floating.png)

Tiling layout
![tiling](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/tiling.png)

***

## Others (not included)
- Grub theme: [Slaze](https://github.com/vinceliuice/grub2-themes)
- System wide dark theme: [matcha-dark-azul](https://github.com/vinceliuice/matcha-gtk-theme)
- Icon theme: [Paper](https://github.com/snwh/paper-icon-theme)
- Firefox theme: [Firefox-mod](https://github.com/datttran/Firefox-mod)
- Terminal meme generator: [`memethesis-cli`](https://github.com/fakefred/memethesis-cli)
- Mirror phone screen: [`scrcpy`](https://github.com/Genymobile/scrcpy)
- `scrcpy` user interface: [`scrcpy-gui`](https://github.com/Tomotoes/scrcpy-gui)

NOTE: If you want to change graphical settings, such as the cursor theme or the icon theme, use `lxappearance`.

## Terminal
- Terminal: `kitty`
- Terminal color scheme: [Nord](http://nordtheme.com/)
- Terminal font: [Fira Code](https://github.com/tonsky/FiraCode)
- Terminal config creator: [`kitty-cat`](https://github.com/adi1090x/kitty-cat)

NOTE: I installed Nord Theme and Fira Code for `kitty` using kitty-cat. There is no need to install kitty-cat again, as the config is already created. Also, to run `kitty`, you need OpenGL 3.3 or newer. If you have OpenGL 3.2 or older, use `urxvt`, the config files are already included.

- Terminal file manager: `vifm`
- Terminal history: [`resh`](https://github.com/curusarn/resh)
- Terminal clock: `tty-clock`
- Bash prompt: [`powerline`](https://github.com/powerline/powerline)
- Terminal startup script: [`shell-color-scripts`](https://gitlab.com/dwt1/shell-color-scripts)
- Get system info: `neofetch`

## Terminal addons
### vifm
Installation instructions:
- Debian/Mint/Ubuntu: `sudo apt install vifm ffmpegthumbnailer poppler* imagemagick xdotool fzf sxiv`
- Arch Linux/Manjaro: `sudo pacman -S vifm ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv`

Install dependencies:

```bash
sudo pip3 install ueberzug # ueberzug
git clone https://github.com/marianosimone/epub-thumbnailer # epub-thumbnailer
cd epub-thumbnailer
pip install pillow
sudo python install.py install
git clone https://github.com/sdushantha/fontpreview # fontpreview
cd fontpreview
sudo make install
```

Finally copy `vifmrun` to `/usr/bin`:
```
cd dotfiles
chmod 777 vifrmrun
sudo cp .config/vifm/vifmrun /usr/bin
```

If you want to use `vifm`, just run it from the terminal.

### powerline
Installation instructions:
- Debian/Mint/Ubuntu: `sudo apt install powerline python-pip python3; pip install powerline-status`
- Arch Linux/Manjaro: `sudo pacman -S powerline python-pip python3; pip install powerline-status`

- After this, check where powerline is installed: `pip show powerline-status | grep -E "^Location:"`
- Copy the directory (should be like `/home/$USER/.local/lib/...`).
- Modify `~/.bashrc`
- Find `. ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh`
- Replace `~/.local/lib/python2.7/site-packages` with the new location you found.

Now we need to apply the themes.
- `cd` into the directory above (should be like `~/.local/lib/python3.8/site-packages/powerline`)
- `cd config_files; powerline_lint` this will apply the powerline themes.

### shell-color-scripts
Installation instructions:

```bash
git clone https://gitlab.com/dwt1/shell-color-scripts
cd shell-color-scripts
rm -rf /opt/shell-color-scripts || return 1
sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
sudo cp colorscript.sh /usr/bin/colorscript
```
Add this line if you use zsh:
```
sudo cp zsh_completion/_colorscript /usr/share/zsh/site-functions
```

***

## Window Manager
- Window Manager: `i3`
- Status bar: `i3bar`
- Status bar font: [FontAwesome](https://github.com/fontawesome/fontawesome)
- Lock screen: `i3lock`
- Screensaver: `xscreensaver`
- Automatic lock: `xautolock`

## Window Manager addons

### xscreensaver
Install `xscreensaver`:

- Debian/Mint/Ubuntu: `sudo apt install xscreeensaver xscreensaver-gl*`
- Arch Linux/Manjaro: `sudo pacman -S xscreeensaver xscreensaver-gl*`

### xautolock
Install `xautolock`:

- Debian/Mint/Ubuntu: `sudo apt install xautolock`
- Arch Linux/Manjaro: `sudo pacman -S xautolock`

***

## Extras
### Image viewer
- Image viewer: `feh`

### Music
- Music player: `cmus`
- Music visualizer: [cli-visualizer](https://github.com/dpayne/cli-visualizer)

NOTE: to launch cli-visualizer, run `vis`

### Text editor
- Text editor: `vim`
- Vim color scheme: deus
- Vim package managers: vim-plug, vim-pathogen
- Vim status bar: vim-airline

PLEASE see [readme.txt inside .vim](https://github.com/godzm4tt3o/dotfiles/blob/master/.vim/readme.txt)

***

## Installation
Get i3:
- Debian/Mint/Ubuntu: `sudo apt install i3-wm dunst i3lock i3status`
- Arch Linux/Manjaro: `sudo pacman -S i3-wm dunst i3lock i3status`

Install additional packages:
- Debian/Mint/Ubuntu: `sudo apt install git compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior feh kitty tty-clock xinit`
- Arch Linux/Manjaro: `sudo pacman -S git compton hsetroot rxvt-unicode xsel rofi noto-fonts xsettingsd lxappearance scrot viewnior feh kitty xorg-xinit`

To install `fonts-mplus` on Arch Linux, use `yay -S ttf-mplus` or:

```
git clone https://aur.archlinux.org/ttf-mplus
cd ttf-mplus
makepkg -si
```

NOTE: if you don't use a display manager (such as LightDM or GDM), add the following line to `~/.xinitrc`:

```
exec i3
```

### Copying configurations
WARNING: THIS WILL REPLACE YOUR EXISTING CONFIGURATIONS!!!
If you don't want to replace your existing configurations, please append the lines of my files to your files (if they exist already)

```
git clone https://github.com/GoDzM4TT3O/dotfiles # clone the repo
cd dotfiles # go into the dotfiles directory
cp -r .{config,vim*,bash*,x*,X*} ~ # copy the dotfiles
cp {locker,wallpaper.png} ~ # copy locker and the wallpaper
```

### Modifying configurations
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
        format = "<span background='#f59335'>  %5min Load </span>"
}

disk "/" {
        format = "<span background='#fec7cd'>  %free Free </span>"
}

memory {
        format = "%used"
	threshold_degraded = "10%"
	format_degraded = "MEMORY: %free"
}

ethernet enp3s0 {
        format_up = "<span background='#88c0d0'>  %ip </span>"
        format_down = "<span background='#88c0d0'>  Disconnected </span>"
}

wireless wlp4s0 {
        format_up = "<span background='#b48ead'>  %essid </span>"
        format_down = "<span background='#b48ead'>  Disconnected </span>"
}

volume master {
        format = "<span background='#ebcb8b'>  %volume </span>"
        format_muted = "<span background='#ebcb8b'>  Muted </span>"
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
        status_unk = " Unknown"
        status_full = "  Charged"
        path = "/sys/class/power_supply/BAT%d/uevent"
        low_threshold = 10
}

tztime local {
		format = "<span background='#81a1c1'> %time </span>"
		format_time = " %A %-d %B %Y %R"
}
```

Make sure to replace the network interfaces.
