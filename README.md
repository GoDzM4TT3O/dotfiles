# GoDzM4TT3O's dotfiles
## Sections:
- [Sections](#sections)
- [Previews](#previews)
- [Help](#help)
- [Others (not included)](#others-not-included)
- [Terminal](#terminal)
- [Terminal addons](#terminal-addons)
	- [Vifm](#vifm)
	- [Powerline](#powerline)
	- [Shell Color Scripts](#shell-color-scripts)
- [Window Manager](#window-manager)
- [Window Manager addons](#window-manager-addons)
	- [Automatic lock](#xautolock)
	- [LightDM](#lightdm)
	- [LightDM theme](#lightdm-theme)
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

## Help
It is recommended that you please check [this page](https://godzm4tt3o.js.org/dotfiles/KEYBINDINGS).

It contains all of the custom keybindings that I use with i3wm.

## Others (not included)
- Grub theme: [Slaze](https://github.com/vinceliuice/grub2-themes)
- System wide dark theme: [matcha-dark-azul](https://github.com/vinceliuice/matcha-gtk-theme)
- Icon theme: [Paper](https://github.com/snwh/paper-icon-theme)
- Firefox theme: [Firefox-mod](https://github.com/datguypiko/Firefox-mod)
- Terminal meme generator: [`memethesis-cli`](https://github.com/fakefred/memethesis-cli)
- Mirror phone screen: [`scrcpy`](https://github.com/Genymobile/scrcpy)

NOTE: If you want to change graphical settings, such as the cursor theme or the icon theme, use `lxappearance`.
You can now install everything in this list by simply running the [archinst](https://github.com/GoDzM4TT3O/dotfiles/blob/master/archinst.sh) script! Run it with the following commands:

```bash
cd ~
wget https://raw.githubusercontent.com/GoDzM4TT3O/dotfiles/master/archinst.sh
chmod +x archinst.sh
./archinst.sh
```

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
- Debian/Mint/Ubuntu: `sudo apt install python-pip python3 vifm ffmpegthumbnailer poppler* imagemagick xdotool fzf sxiv`
- Arch Linux/Manjaro: `sudo pacman -S python-pip python3 vifm ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv`

Install dependencies:

```bash
cd ~ # go into /home/$USER
sudo pip3 install ueberzug # ueberzug
git clone https://github.com/marianosimone/epub-thumbnailer # epub-thumbnailer
cd epub-thumbnailer
pip install pillow # install/update python pillow
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
# add alias vifm="vifmrun" to .bash_aliases
# in my config it is already done
```

If you want to use `vifm`, just run it from the terminal.

### powerline
Installation instructions:
- Debian/Mint/Ubuntu: `sudo apt install powerline python-pip python3; pip install powerline-status`
- Arch Linux/Manjaro: `sudo pacman -S powerline python-pip python3; pip install powerline-status`


If you use Python 3.8 ignore these 5 lines below, otherwise follow what they say:

- After this, check where powerline is installed: `pip show powerline-status | grep -E "^Location:"`
- Copy the directory (should be like `/home/$USER/.local/lib/...`).
- Modify `~/.bashrc`
- Find `. ~/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh`
- Replace `~/.local/lib/python3.8/site-packages` with the new location you found.


Now we need to apply the themes:

- `cd` into the directory above (should be like `~/.local/lib/python3.8/site-packages/powerline` if you use python 3.8)
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
- Status bar font: [FontAwesome](https://github.com/fortawesome/fontawesome)
- Lock screen: `i3lock`

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

How to configure `vim` properly:
+ Open Vim: `vim`
+ Run `:PlugInstall` inside Vim
+ Quit Vim: `:q`
+ Clone the `vim-airline` repositories:
```
git clone https://github.com/vim-airline/vim-airline && mv vim-airline ~/.vim/bundle/vim-airline || return 1
git clone https://github.com/vim-airline/vim-airline-themes && mv vim-airline ~/.vim/bundle/vim-airline-themes || return 1
```
+ After this, everything should be working properly.

Vim usage instructions: [readme.txt inside .vim](https://github.com/godzm4tt3o/dotfiles/blob/master/.vim/readme.txt)

***

## Installation
Get i3:
- Debian/Mint/Ubuntu: `sudo apt install i3-wm dunst i3lock i3status`
- Arch Linux/Manjaro: `sudo pacman -S i3-wm dunst i3lock i3status`

Install additional packages:
- Debian/Mint/Ubuntu: `sudo apt install git compton hsetroot rxvt-unicode xsel rofi fonts-noto fonts-mplus xsettingsd lxappearance scrot viewnior feh kitty tty-clock xinit`
- Arch Linux/Manjaro: `sudo pacman -S git compton hsetroot rxvt-unicode xsel rofi noto-fonts xsettingsd lxappearance scrot viewnior feh kitty xorg-xinit ttf-font-awesome ttf-fira-code`

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
cp -r {wallpapers,archlogo.txt,randomwall.sh} ~ # copy wallpaper stuff and ascii arch linux logo
cp {u,}mount ~ # copy mount/unmount scripts
```

### Modifying configurations
You should modify `~/.config/i3status/config`, because it contains network interfaces that might be different from yours.
Change `wlan0` and `enp3s0` with your network interfaces.
You can find yours by running the command `ip link | grep -oE "^[2-9]: [e-w]....."`, then you will likely have two results.
My results are "2: enp3s0" and "3: wlan0". You need to copy the interface names (after the number and the colon) respectively over the existing interfaces.
For example, if your results are "2: eth0" and "3: wlp4s0", replace "enp3s0" with "eth0", and "wlan0" with "wlp4s0".

~~I also removed CPU temperature from the i3bar. To add it back, replace "~/.config/i3status/config" with the lines below:~~
Now it is enabled by default. Turns out ubuntu wouldn't show CPU temperature, but Arch does.

Make sure to replace the network interfaces and the battery (my battery is BAT1 but for you it could be BAT0).
