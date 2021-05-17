# Salonia Matteo's dotfiles
## Sections:
- [Donate](#Donate)
- [Cloning](#cloning)
- [Previews](#previews)
- [Help](#help)
- [Others (not included)](#others-not-included)
	- [LibreWolf Addons](#librewolf-addons)
- [Terminal](#terminal)
	- [Shell](#shell)
- [Window Manager](#window-manager)
	- [Slock (suckless locker)](#slock)
- [Intel Undervolt](#intel-undervolt)
- [Low Battery Notifier](#low-battery-notifier)
- [Installation](#installation)
	- [Artix Install Script](#Artix-Script)
	- [Gentoo Install Script](#Gentoo-Script)
	- [Copying the configurations](#copying-configurations)

***

## Donate
Support this project: https://saloniamatteo.top/donate.html

## Cloning
NOTE! Please clone this repository with the following command: `git clone --recurse-submodules https://github.com/saloniamatteo/dotfiles`

The directory `dwm` is a submodule that points to [saloniamatteo/dwm](https://github.com/saloniamatteo/dwm) and might not get downloaded when cloning normally!

## Previews

See [saloniamatteo/dwm#previews](https://github.com/saloniamatteo/dwm#previews) for more pictures.

Tiling st window with zsh prompt
![st-tile](https://raw.githubusercontent.com/saloniamatteo/dwm/master/Previews/preview-st.png)

Tiling st window with floating program
![tile-float](https://raw.githubusercontent.com/saloniamatteo/dwm/master/Previews/preview-floating-win.png)

Tiling layout (programs: `ranger`, `nvim`, and `tty-clock`)
![layout-tile](https://raw.githubusercontent.com/saloniamatteo/dwm/master/Previews/layouts-tile.png)

CenteredMaster layout (programs: `neofetch`, `ranger` and `htop`)
![layout-centeredmaster](https://raw.githubusercontent.com/saloniamatteo/dwm/master/Previews/layouts-centeredmaster.png)

***

## Help
Have any issues with dwm? Check the [`man` page](https://github.com/saloniamatteo/dwm/blob/master/dwm.1) or read the [source code](https://github.com/saloniamatteo/dwm/blob/master/config.h), it contains all of the custom keybindings that I use with dwm.

NOTE: [saloniamatteo/dwm](https://github.com/saloniamatteo/dwm) is the main repository for my build of dwm & dwmblocks. If you need any help, go there.

## Others (not included)
- Grub theme: [Artix Silence](https://aur.archlinux.org/packages/artix-silence-grub-theme-git)
- System wide dark theme: [matcha-dark-azul](https://github.com/vinceliuice/matcha-gtk-theme)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Simply mount android: [`simple-mtpfs`](https://wiki.archlinux.org/index.php/Media_Transfer_Protocol#simple-mtpfs)
- Check disk usage: [`ncdu`](https://dev.yorhel.nl/ncdu)
- Luke Smith's [domain blocklist](https://github.com/LukeSmithxyz/etc)

NOTE: If you want to change graphical settings, such as the cursor theme or the icon theme, use `lxappearance`.
You can now install everything in this list by simply running the [archinst](https://github.com/saloniamatteo/dotfiles/blob/master/archinst.sh) install scripts! Run one of them with the following commands:

```bash
# OpenRC only!
wget https://raw.githubusercontent.com/saloniamatteo/dotfiles/master/archinst-openrc.sh &&
chmod +x archinst-openrc.sh &&
sh archinst-openrc.sh
```

### LibreWolf addons
Here's a list of the LibreWolf (Firefox) addons I use:
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
- Terminal: `st` (Luke's build with my keybindings ([included](https://github.com/saloniamatteo/pkgbuilds/tree/master/st-matteo)))
- Terminal file manager: `ranger`
- Get system info: `neofetch`

### Shell
I use `zsh`.

***

## Window Manager
- Window Manager: `dwm`
- Status bar: `dwmblocks` 
- Lock screen: `slock` 
- Automatic lock: `xautolock`
- Display manager: `lightdm`
- LightDM theme: [`saluto-lightdm-theme-dwm`](https://aur.archlinux.org/packages/saluto-lightdm-theme-dwm)

### Slock
I have included my own build of [slock](https://tools.suckless.org/slock) with two patches:

- Caps color: turns the screen bright red to alert the user that caps lock is on

- Message: include a custom message; with my custom build you can see when the screen was locked & a random quote, using fortune.

To install Slock, run:

```bash
cd $HOME/Documents/dotfiles/dotfiles &&
cd slock &&
sudo make clean install
```

Another build of mine, called `slock-red` is included. This build has its background color always set to red.

***

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

### Low battery notifier
I wrote my own low battery notifier. If one of your batteries' capacity is less than 20%, it will send a critical notification, containing said battery name and its capacity. To make this work, you need to install a cron manager. (I use `cronie`)

After you're done, run this command: `crontab -e`, then add these two lines
(assuming $UID is `1000`, which should be the first user you create, apart from root):

```
# if the user's battery's percentage is <20% and it is not charging, warn the user
* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ~/.config/scripts/bat-warn
```

You're done! I also have this in my root crontab:

`*/30 * * * * /usr/bin/updatedb`

Every 30 minutes the command `updatedb` will run, so that the next time you run `locate FILE` it will be very fast to show you where a file is.

***

## Installation
See the Arch install script, and base yourself off of that.

### Artix-Script

If you have an Arch-based distro that uses OpenRC, run the following commands:

```bash
mkdir -p ~/Documents/dotfiles
cd ~/Documents/dotfiles
git clone --recurse-submodules https://github.com/saloniamatteo/dotfiles
cd dotfiles
./archinst-openrc.sh
```

### Gentoo-Script

If you run Gentoo, run the commands below:

```bash
mkdir -p ~/Documents/dotfiles
cd ~/Documents/dotfiles
git clone --recurse-submodules https://github.com/saloniamatteo/dotfiles
cd dotfiles
./gentoo.sh
```

systemd is not supported in neither of the scripts.
