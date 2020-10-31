# GoDzM4TT3O's dotfiles
## Sections:
- [Sections](#sections)
+ [Previews](#previews)
	- [st](#st)
	- [kitty](#kitty)
- [Help](#help)
- [Others (not included)](#others-not-included)
	- [Firefox Addons](#firefox-addons)
- [Terminal](#terminal)
	- [Shell](#shell)
- [Terminal addons](#terminal-addons)
	- [Vifm](#vifm)
	- [Shell Color Scripts](#shell-color-scripts)
	- [Exa](#exa)
- [Window Manager](#window-manager)
	- [Polybar](#polybar)
- [Window Manager addons](#window-manager-addons)
	- [Automatic lock](#xautolock)
	- [LightDM](#lightdm)
	- [LightDM theme](#lightdm-theme)
	- [Slock (suckless locker)](#slock)
- [Extras](#extras)
	- [Image Viewer](#image-viewer)
	- [Music](#music)
	- [Text editor](#text-editor)
	- [Network Manager](#network-manager)
	- [Low battery notifier](#low-battery-notifier)
	- [RSS Reader](#rss-reader)
	- [Intel Undervolt](#intel-undervolt)
- [Installation](#installation)
	- [Copying the configurations](#copying-configurations)
	- [Modifying the configurations](#modifying-configurations)


***

## Previews

### st
(suckless terminal)

Floating st window with zsh prompt
![st-float](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-float.png)

Two st windows (programs: `htop` and cli-visualizer, the command for the latter is `vis`)
![st-two](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-two.png)

Three st windows (programs: neofetch, vifm and tty-clock)
![st-three](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-three.png)

Three st windows with floating layout (programs: `tty-clock`, cli-visualizer (`vis`) and `htop`)
![st-three-float](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-three-float.png)

### kitty

Floating kitty window with zsh prompt
![kitty-float](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/kitty-float.png)

Two kitty windows (programs: `htop` and cli-visualizer, the command for the latter is `vis`)
![kitty-two](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/kitty-two.png)

Three kitty windows (programs: neofetch, vifm and tty-clock)
![kitty-three](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/kitty-three.png)

Three kitty windows with floating layout (programs: `tty-clock`, cli-visualizer (`vis`) and `htop`)
![kitty-three-float](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/kitty-three-float.png)

***

## Help
It is recommended that you please check [this page](https://godzm4tt3o.js.org/dotfiles/KEYBINDINGS).

It contains all of the custom keybindings that I use with i3wm.

You can also check [this file](https://github.com/GoDzM4TT3O/dotfiles/blob/master/.vim/tips.md), it contains a few Vim tricks you didn't know!

## Others (not included)
- Grub theme: [Arch Silence](https://github.com/fghibellini/arch-silence); I previously used [Slaze](https://github.com/vinceliuice/grub2-themes)
- System wide dark theme: [matcha-dark-azul](https://github.com/vinceliuice/matcha-gtk-theme)
- Icon theme: [Paper](https://github.com/snwh/paper-icon-theme)
- Firefox theme: [Firefox-mod](https://github.com/datguypiko/Firefox-mod)
- Terminal meme generator: [`memethesis-cli`](https://github.com/fakefred/memethesis-cli)
- Mirror phone screen: [`scrcpy`](https://github.com/Genymobile/scrcpy)
- System security hardening: [`apparmor`](https://wiki.archlinux.org/index.php/Apparmor); I also use [`linux-hardened`](https://wiki.archlinux.org/index.php/Security#Kernel_hardening)
- Simply mount android: [`simple-mtpfs`](https://wiki.archlinux.org/index.php/Media_Transfer_Protocol#simple-mtpfs)
- Check disk usage: [`ncdu`](https://dev.yorhel.nl/ncdu)
- Luke Smith's [domain blocklist](https://github.com/LukeSmithxyz/etc)

NOTE: If you want to change graphical settings, such as the cursor theme or the icon theme, use `lxappearance`.
You can now install everything in this list by simply running the [archinst](https://github.com/GoDzM4TT3O/dotfiles/blob/master/archinst.sh) script! Run it with the following commands:

```bash
cd ~; wget https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/archinst.sh && chmod +x archinst.sh && ./archinst.sh
```

### Firefox addons
Here's a list of the firefox addons I use:
- ClearURLs
- Dark Reader
- Facebook Container
- Google Container - with Integrations
- HTTPS Everywhere
- Popup Blocker (strict)
- Search by Image
- SponsorBlock for YouTube
- uBlock Origin
- Universal Bypass

## Terminal
- Terminal: `st` (luke's build) and `kitty` (my own config)
- Terminal color scheme: [Nord](http://nordtheme.com/)
- Terminal font: [Fira Code](https://github.com/tonsky/FiraCode)
- Terminal config creator: [`kitty-cat`](https://github.com/adi1090x/kitty-cat)

NOTE: I installed Nord Theme and Fira Code for `kitty` using kitty-cat. There is no need to install kitty-cat again, as the config is already created. Also, to run `kitty`, you need OpenGL 3.3 or newer. If you have OpenGL 3.2 or older, use `urxvt`, the config files are already included.

- Terminal file manager: `vifm`
- Terminal clock: `tty-clock`
- Terminal startup script: [`shell-color-scripts`](https://gitlab.com/dwt1/shell-color-scripts)
- Get system info: `neofetch`

Please install [`st`](https://github.com/LukeSmithxyz/st), otherwise the default i3 config might not work for you, unless you modify it.

### Shell
I use `zsh`. To make it work, you need to install zsh and oh-my-zsh:

- Debian/Mint/Ubuntu: `sudo apt install zsh; cd ~; sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Arch Linux/Manjaro: `sudo pacman -S zsh; yay -S oh-my-zsh-git # replace yay with any other AUR helper`

Make `zsh` the default shell: `chsh -s /bin/zsh`

#### Plugins

+ `zsh-autosuggestions`
	- To install it, run: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

+ `fast-syntax-highlighting`
	- To install it, run: `git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`

+ `Powerleve10k` (shell prompt)
	- To install it, run: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`

## Terminal addons
### vifm
Installation instructions:
- Debian/Mint/Ubuntu: `sudo apt install python-pip python3 vifm ffmpegthumbnailer poppler* imagemagick xdotool fzf sxiv`
- Arch Linux/Manjaro: `sudo pacman -S python-pip python3 vifm ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv`

Install dependencies:

```bash
cd ~ # go into /home/$USER
sudo pip3 install --upgrade ueberzug # ueberzug
git clone https://github.com/marianosimone/epub-thumbnailer # epub-thumbnailer
cd epub-thumbnailer
pip install --upgrade pillow # install/update python pillow
sudo python install.py install # install epub-thumbnailer
cd ~ # go into /home/$USER
git clone https://github.com/sdushantha/fontpreview # fontpreview
cd fontpreview
sudo make install # install fontpreview
```

Configure vifm image previews and use custom vifm run script:
```
cd dotfiles/.config/vifm
chmod 777 {vifmrun,scripts/vifmimg}
sudo cp .config/vifm/vifmrun /usr/bin
# add alias vifm="vifmrun" to .aliases
# in my config it is already done
```

If you want to use `vifm`, just run it from the terminal.

### shell-color-scripts
Installation instructions:

```bash
git clone https://gitlab.com/dwt1/shell-color-scripts
cd shell-color-scripts
rm -rf /opt/shell-color-scripts || return 1
sudo mkdir -p /opt/shell-color-scripts/colorscripts || return 1
sudo cp -rf colorscripts/* /opt/shell-color-scripts/colorscripts
sudo cp colorscript.sh /usr/bin/colorscript
sudo cp zsh_completion/_colorscript /usr/share/zsh/site-functions
```

### Exa
Exa is a replacement for ls. It is more beautiful, and it is better than ls.

Installation instructions:

- Debian/Mint/Ubuntu: `sudo apt install exa`
(if it doesn't work please check https://the.exa.website/)

- Arch Linux/Manjaro: `sudo pacman -S exa`

***

## Window Manager
- Window Manager: `i3-gaps`
- Status bar: `polybar` (`i3status` config is available, see .config/i3/config)
- Lock screen: `i3lock` (SUPER+L), `slock` (after 10 minutes of inactivity)

### polybar
I use polybar. It's far better than i3bar and i3status.

Installation instructions:

- Arch Linux/Manjaro: `yay -S polybar`
- Other distros: please refer [to this guide](https://github.com/polybar/polybar#getting-started)

## Window Manager addons
- Automatic lock: `xautolock`
- Display manager: `lightdm`
- LightDM theme: `lightdm-webkit-theme-aether`

### xautolock
Install `xautolock`:

- Debian/Mint/Ubuntu: `sudo apt install xautolock`
- Arch Linux/Manjaro: `sudo pacman -S xautolock`

### LightDM
Install `lightdm`:

- Debian/Mint/Ubuntu: `sudo apt install lightdm`
- Arch Linux/Manjaro: `sudo pacman -S lightdm`

### LightDM theme
Install the required packages:

- Debian/Mint/Ubuntu: `sudo apt install lightdm-webkit*-greeter`
- Arch Linux/Manjaro: `sudo pacman -S lightdm-webkit2-greeter`

Custom theme installation.

- Debian/Mint/Ubuntu:

```
# If you prefer the last stable release, download from the releases page instead: https://github.com/NoiSek/Aether/releases/latest
git clone git@github.com:NoiSek/Aether.git
sudo cp --recursive Aether /usr/share/lightdm-webkit/themes/Aether

# Set default lightdm-webkit2-greeter theme to Aether
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = lightdm-webkit-theme-aether #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf

# Set default lightdm greeter to lightdm-webkit2-greeter
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
```

- Arch Linux/Manjaro: `sudo pacman -S yay --needed; yay -S lightdm-webkit-theme-aether`

Enabling LightDM: `sudo systemctl enable lightdm.service`

[Replace current display manager with LightDM](https://github.com/NoiSek/Aether#installation):
```
sudo systemctl disable gdm
sudo systemctl disable sddm
sudo systemctl disable lxdm
```

### Slock
I have included my own build of [slock](https://tools.suckless.org/slock) with two patches:

- Caps color: turns the screen bright red to alert the user that caps lock is on

- Message: include a custom message; with my custom build you can see when the screen was locked & a random quote, using fortune.

You also need to install fortune, or you can modify the [i3config](https://github.com/GoDzM4TT3O/dotfiles/blob/master/.config/i3/config#L61) file. You can install fortune using [these instructions](https://github.com/GoDzM4TT3O/dotfiles/tree/master/slock).

Alternatively, you can use LightDM or i3lock as a screen locker, instead of Slock, if you don't like Slock.

To install Slock, run:

```bash
cd ~/dotfiles # I assume you cloned this repo in your home directory
cd slock
sudo make install
```

***

## Extras
### Image viewer
- Image viewer: `feh`

### Music
- Music player: `cmus`
- Music visualizer: [cli-visualizer](https://github.com/dpayne/cli-visualizer)

NOTE: to launch cli-visualizer, run `vis`

### Text editor
- Text editor: `vim` / `nvim` (neovim)
- Vim color scheme: monokai
- Vim package manager: vim-plug
- Vim status bar: lightline.vim

How to configure `vim` properly:
+ Open Vim: `vim`
+ Run `:PlugInstall` inside Vim
+ After this, everything should be working properly.

Vim usage instructions: [readme.txt inside .vim](https://github.com/godzm4tt3o/dotfiles/blob/master/.vim/readme.txt)

### Network manager
I use [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu). It's a network manager that integrates with dmenu. To launch it, press SUPER+N (n for network).

Installation instructions:

- Arch Linux/Manjaro: `yay -S networkmanager-dmenu-git`
- All of the other distros: https://github.com/firecat53/networkmanager-dmenu#installation

### Low battery notifier
I wrote my own low battery notifier. If one of your batteries' capacity is less than 20%, it will send a critical notification, containing said battery name and its capacity. To make this work, you need to install a cron manager.

Installation instructions:

- Debian/Mint/Ubuntu: cron should already be installed;
- Arch Linux/Manjaro: `sudo pacman -S cronie`;

I don't know if Manjaro ships with a cron manager.

After you're done, run this command: `crontab -e`, then add this line:

`* * * * * XDG_RUNTIME_DIR=/run/user/$(id -u) ~/.config/scripts/bat-warn`

You're done! I also have this in my root crontab (`sudo crontab -e`):

`*/30 * * * * /usr/bin/updatedb`

Every 30 minutes the command "updatedb" will run, so that the next time you run "locate FILE" it will be very fast to show you where a file is.

### RSS Reader

I use Newsboat, with Luke Smith's custom config and my own URLs.
You can use Newsboat to open Youtube videos in `mpv`, but first you need to install `urlscan`:

- Debian/Mint/Ubuntu: `sudo apt install urlscan`
- Arch Linux/Manjaro: `sudo pacman -S urlscan`

### Intel Undervolt

#### READ CAREFULLY!

I have a ThinkPad T440p with an Intel Core i5-4340M (Haswell). I have installed a tool that undervolts the CPU. `intel-undervolt`'s configuration file is located over at `/etc/intel-undervolt.conf`. My config file can be found in the root of this repository and is not copied over by default for security reasons. You have to be careful with undervolting, so read the following info ***CAREFULLY***!

- Values over -60mV are considered ***UNSAFE***, unless you know what you are doing!
- You know when you undervolted too much when the screen starts flickering, or you cannot perform any benchmark (either graphical benchmarks that involve the iGPU/GPU or benchmarks that involve the CPU)
- Generally, undervolting is safer than overclocking
- I have found that the best performance obtainable by my laptop was achieved using `intel-undervolt`, `cpuface` (to use the performance governor), `ThinkPad Fan Control` (to control the fan speed) and, obviously, while charging the laptop.

Here are my laptop's highest benchmark results: https://browser.geekbench.com/v5/cpu/4443158
	
I do not condone undervolting. Do it at your own risk.

***

## Installation
Get i3-gaps:
- Debian/Mint/Ubuntu: `sudo apt install i3-gaps dunst i3lock i3status`
- Arch Linux/Manjaro: `sudo pacman -S --needed i3-gaps dunst i3lock i3status`

Install additional packages:
- Debian/Mint/Ubuntu: `sudo apt install copyq git fortune-mod picom hsetroot exa zsh xsel rofi fonts-noto xsettingsd lxappearance scrot feh kitty xinit fonts-font-awesome fonts-fira-code vifm neofetch python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses fftw cmake vim nvim`
- Arch Linux/Manjaro: `sudo pacman -S --needed copyq git fortune-mod picom hsetroot exa zsh xsel rofi noto-fonts xsettingsd lxappearance scrot feh kitty xorg-xinit ttf-font-awesome ttf-fira-code vifm neofetch python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses fftw cmake vim nvim`

NOTE: if you don't use a display manager (such as LightDM or GDM), add the following line to `~/.xinitrc`:

```
exec i3
```

### Copying configurations
WARNING: THIS WILL REPLACE YOUR EXISTING CONFIGURATIONS!!!
If you don't want to replace your existing configurations, please manually edit your files!

```bash
cd ~; git clone https://github.com/GoDzM4TT3O/dotfiles && cd dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*,p10k.zsh,local} ~ && cp -r {wallpaper*,archlogo.txt,italiarch.png} ~ 
```

### Modifying configurations
Currently, I use polybar instead of i3status, but the information below is still relevant. The configuration file is located in `.config/polybar/config`. Customize it however you want, enable/disable any module you want ;)

NOTE: on some laptops, you should modify the battery name. For example, instead of being called "BAT1", the battery on my Thinkpad T440p is called "BAT0". You can find the available batteries under "/sys/class/power_supply/BAT?". If you have more than one battery (such as Thinkpads with an internal and external battery), try to duplicate the battery indicator, giving it another name (such as "modules/battery-int" or "modules/battery-ext").
You also need to modify the wireless interface and the wired interface names, found in the same configuration file, under their appropriate module categories (modules/wlan and modules/eth). The info below can help you.

If you want to use i3status, you should modify `~/.config/i3status/config`, because it contains network interfaces that might be different from yours.
Change `wlan0` and `enp3s0` with your network interfaces.
You can find yours by running the command `ip link | grep -oE "^[2-9]: [e-w]......"`, then you will likely have two results.
My results are "2: enp3s0" and "3: wlan0". You need to copy the interface names (after the number and the colon) respectively over the existing interfaces.
For example, if your results are "2: eth0" and "3: wlp4s0", replace "enp3s0" with "eth0", and "wlan0" with "wlp4s0".

Make sure to replace the network interfaces and the battery (my battery is BAT1 but for you it could be BAT0).
