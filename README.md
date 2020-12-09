# GoDzM4TT3O's dotfiles
## Sections:
- [Sections](#sections)
+ [Previews](#previews)
	- [st](#st)
- [Help](#help)
- [Others (not included)](#others-not-included)
	- [Firefox Addons](#firefox-addons)
- [Terminal](#terminal)
	- [Shell](#shell)
- [Window Manager](#window-manager)
	- [DwmBlocks](#dwmblocks)
- [Window Manager addons](#window-manager-addons)
	- [Automatic lock](#xautolock)
	- [LightDM](#lightdm)
	- [LightDM theme](#lightdm-theme)
	- [Slock (suckless locker)](#slock)
- [Extras](#extras)
	- [Image Viewer](#image-viewer)
	- [Text editor](#text-editor)
	- [Network Manager](#network-manager)
	- [Intel Undervolt](#intel-undervolt)
	+ [My Scripts](#my-scripts)
		- [Low Battery Notifier](#low-battery-notifier)
		- [Disk Usage](#disk-usage)
		- [Display Select](#displayselect)
		- [Dmenu Unicode](#dmenuunicode)
		- [Downloader](#downloader)
		- [Fix Webcam](#fix-webcam)
		- [Inactivity](#inactivity)
		- [Launcher](#launcher)
		- [Mount](#mount)
		- [Random wallpaper](#randomwall-now)
		- [Umount](#umount)
		- [Webcam](#webcam)
- [Installation](#installation)
	- [Copying the configurations](#copying-configurations)
	- [Modifying the configurations](#modifying-configurations)

***

## Previews

### st
(suckless terminal)

Tiling st window with zsh prompt
![st-tile](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-tile.png)

Floating st window with zsh prompt
![st-float](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-float.png)

Two st windows (programs: `htop` and `ranger`)
![st-two](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-two.png)

Three st windows (programs: `neofetch`, `ranger` and `htop`)
![st-three](https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/previews/st-three.png)

***

## Help
Have any issues with dwm? Check the [`man` page](https://github.com/GoDzM4TT3O/dotfiles/blob/master/dwm/dwm.1) or read the [source code](https://github.com/GoDzM4TT3O/dotfiles/blob/master/dwm/config.h), it contains all of the custom keybindings that I use with dwm.

## Others (not included)
- Grub theme: [Arch Silence](https://github.com/fghibellini/arch-silence); I previously used [Slaze](https://github.com/vinceliuice/grub2-themes)
- System wide dark theme: [matcha-dark-azul](https://github.com/vinceliuice/matcha-gtk-theme)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Simply mount android: [`simple-mtpfs`](https://wiki.archlinux.org/index.php/Media_Transfer_Protocol#simple-mtpfs)
- Check disk usage: [`ncdu`](https://dev.yorhel.nl/ncdu)
- Luke Smith's [domain blocklist](https://github.com/LukeSmithxyz/etc)

NOTE: If you want to change graphical settings, such as the cursor theme or the icon theme, use `lxappearance`.
You can now install everything in this list by simply running the [archinst](https://github.com/GoDzM4TT3O/dotfiles/blob/master/archinst.sh) script! Run it with the following commands:

```bash
cd $HOME
wget https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/archinst.sh &&
chmod +x archinst.sh &&
sh archinst.sh
```

### Firefox addons
Here's a list of the firefox addons I use:
- CanvasBlocker
- ClearURLs
- Dark Reader
- DecentralEyes
- Facebook Container
- Google Container - with Integrations
- HTTPS Everywhere
- Popup Blocker (strict)
- Privacy Badger
- Search by Image
- SponsorBlock for YouTube
- uBlock Origin
- Universal Bypass

## Terminal
- Terminal: `st` (Luke's build)
- Terminal file manager: `ranger`
- Get system info: `neofetch`

### Shell
I use `zsh`. To make it work, you need to install zsh and oh-my-zsh:

- Arch Linux/Manjaro: `sudo pacman -S zsh; yay -S oh-my-zsh-git # replace yay with any other AUR helper`

Make `zsh` the default shell: `chsh -s /bin/zsh`

#### Plugins

+ `zsh-autosuggestions`
	- To install it, run: `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

+ `fast-syntax-highlighting`
	- To install it, run: `git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting`

+ `Powerleve10k` (shell prompt)
	- To install it, run: `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k`

***

## Window Manager
- Window Manager: `dwm`
- Status bar: `dwmblocks` 
- Lock screen: `slock` 

## Window Manager addons
- Automatic lock: `xautolock`
- Display manager: `lightdm`
- LightDM theme: [`saluto-lightdm-theme-dwm`](https://aur.archlinux.org/packages/saluto-lightdm-theme-dwm)

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

- Arch Linux/Manjaro: `yay -S saluto-lightdm-theme-dwm`

Enabling LightDM: `sudo systemctl enable lightdm.service` Or `sudo rc-update add xdm default`

Make sure you also disable other display managers:
```
sudo systemctl disable gdm
sudo systemctl disable sddm
sudo systemctl disable lxdm
```

### Slock
I have included my own build of [slock](https://tools.suckless.org/slock) with two patches:

- Caps color: turns the screen bright red to alert the user that caps lock is on

- Message: include a custom message; with my custom build you can see when the screen was locked & a random quote, using fortune.

To install Slock, run:

```bash
cd $HOME/dotfiles &&
cd slock &&
sudo make clean install
```

***

## Extras
### Image viewer
- Image viewer: `sxiv`

### Text editor
- Text editor: `nvim` (neovim)
- Vim color scheme: dogrun
- Vim package manager: vim-plug
- Vim status bar: lightline.vim

How to configure `vim` properly:
+ Open NeoVim: `nvim`
+ Run `:PlugInstall` inside NeoVim
+ After this, everything should be working properly.

NeoVim usage instructions: [readme.txt inside .vim](https://github.com/godzm4tt3o/dotfiles/blob/master/.vim/readme.txt)

### Network manager
I use [networkmanager-dmenu](https://github.com/firecat53/networkmanager-dmenu). It's a network manager that integrates with dmenu. To launch it, press SUPER+N (n for network).

Installation instructions:

- Arch Linux/Manjaro: `yay -S networkmanager-dmenu-git`
- All of the other distros: https://github.com/firecat53/networkmanager-dmenu#installation

### Intel Undervolt

#### READ CAREFULLY!

I have a ThinkPad T440p with an Intel Core i5-4340M (Haswell). I have installed a tool that undervolts the CPU. `intel-undervolt`'s configuration file is located over at `/etc/intel-undervolt.conf`. My config file can be found in the root of this repository and is not copied over by default for security reasons. You have to be careful with undervolting, so read the following info ***CAREFULLY***!

- Values over -60mV are considered ***UNSAFE***, unless you know what you are doing!
- You know when you undervolted too much when the screen starts flickering, or you cannot perform any benchmark (either graphical benchmarks that involve the iGPU/GPU or benchmarks that involve the CPU)
- Generally, undervolting is safer than overclocking
- I have found that the best performance obtainable by my laptop was achieved using `throttled`, `intel-undervolt`, `cpuface` (to use the performance governor), `ThinkPad Fan Control` (to control the fan speed) and, obviously, while charging the laptop.

Here are my laptop's highest benchmark results: https://browser.geekbench.com/v5/cpu/4443158
	
I do not condone undervolting. Do it at your own risk.

***

### My scripts
These sections below contain a list of the scripts I've made. You can refer to [KEYBINDINGS.md](https://godzm4tt3o.js.org/dotfiles/KEYBINDINGS) or [.config/scripts/](https://github.com/GoDzM4TT3O/dotfiles/tree/master/.config/scripts) for a list of scripts, what they do, and how to run them.

### Low battery notifier
I wrote my own low battery notifier. If one of your batteries' capacity is less than 20%, it will send a critical notification, containing said battery name and its capacity. To make this work, you need to install a cron manager.

Installation instructions:

- Debian/Mint/Ubuntu: cron should already be installed;
- Arch Linux/Manjaro: `sudo pacman -S cronie`;

After you're done, run this command: `crontab -e`, then add these two lines:

```
# if the user's battery's percentage is <20% and it is not charging, warn the user
* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ~/.config/scripts/bat-warn

# choose a random wallpaper every three minutes
*/3 * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ~/.config/scripts/randomwall-now
```

You're done! I also have this in my root crontab:

`*/30 * * * * /usr/bin/updatedb`

Every 30 minutes the command "updatedb" will run, so that the next time you run "locate FILE" it will be very fast to show you where a file is.

### Disk-Usage
Monitor a disk's usage using lsblk. You can choose how many seconds to refresh, and which disk/partition.

### DisplaySelect
Choose a monitor/display and use it at its best settings.

### Dmenu Unicode
You can choose an emoji from a list of emojis (file is located in `.config/scripts/emoji`), and copy that emoji to the clipboard.

### Downloader
This script uses youtube-dlc to download songs from YT and convert them to an mp3 file with cover art. It requires you to have a valid YT URL in your clipboard before running it, or you can also enter it manually.

### Fix-Webcam
Sometimes my webcam does not want to turn on. I run this script like I'd run `sudo modprobe -r uvcvideo; sudo modprobe uvcvideo`.

### Inactivity
This script automatically moves the mouse using xdotool to prevent inactivity/automatic screen locking.

### Launcher
This script lets you choose which scripts to run, using dmenu. It looks for executables in `.config/scripts`.

### Mount
Choose which disk/partition to mount and where to mount it.

### Randomwall-now
Immediately choose a random wallpaper from `~/wallpapers`.

### Umount
Unmount a disk/partition.

### Webcam
Toggle webcam (on/off).

***

## Installation
Please see the arch install scripts, and base yourself off of those.

### Copying configurations
WARNING: THIS WILL REPLACE YOUR EXISTING CONFIGURATIONS!!!
If you don't want to replace your existing configurations, please manually edit your files!

```bash
cd ~; git clone https://github.com/GoDzM4TT3O/dotfiles && cd dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*,p10k.zsh,local} ~ && cp -r {wallpaper*,archlogo.txt,italiarch.png} ~ 
```
