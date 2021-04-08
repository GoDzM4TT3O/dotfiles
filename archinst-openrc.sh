#!/usr/bin/bash
# saloniamatteo's dotfiles
# This installer works on distributions based on Arch Linux
# NOTE: This is the OpenRC version. If you use Arch/Manjaro, DON'T use this script!
# You shouldn't run this as root.
# When required, enter your password for doas/sudo.

# Check if root
[ "$EUID" -eq 0 ] && printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n' && exit 1

# Check if `doas` is installed.
# If it is, prefer it to `sudo`
[ $(which doas) ] && root="doas" || root="sudo"

# Use "~/Documents/dotfiles" to store everything that is going to be downloaded
dotfilesdir="$HOME/Documents/dotfiles"

# Use "~/Documents/dotfiles/pkgbuilds" my PKGBUILDS 
pkgbuilddir="$HOME/Documents/dotfiles/pkgbuilddir"

# Use "~/.local/share/zsh" to store zsh plugins
ZSRCDIR="$HOME/.local/share/zsh"

# If the directories above do not exist, create them,
[ ! -d "$dotfilesdir" ] && mkdir -p "$dotfilesdir"
[ ! -d "$ZSRCDIR" ] && mkdir -p "$ZSRCDIR"

# Clone my dotfiles & PKGBUILDS repository there.
[ ! -d "$dotfilesdir/dotfiles" ] && git clone https://github.com/saloniamatteo/dotfiles "$dotfilesdir/dotfiles"
[ ! -d "$pkgbuilddir" ] && git clone https://github.com/saloniamatteo/pkgbuilds "$pkgbuilddir"

printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|

  ___                   ____   ____ 
 / _ \ _ __   ___ _ __ |  _ \ / ___|
| | | | '_ \ / _ \ '_ \| |_) | |    
| |_| | |_) |  __/ | | |  _ <| |___ 
 \___/| .__/ \___|_| |_|_| \_\\\____| version (for Artix)
      |_|                           

@ https://github.com/saloniamatteo/dotfiles
Starting installation...
"

# Check for available updates
printf '\e[1;4m Checking for updates...\e[0m\n'
$root pacman -Syu &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not check for updates!\e[0m\n' 

# Install packages
printf '\e[1;4m Installing packages...\e[0m\n'
$root pacman -S --needed base-devel dmenu dunst curl cmake copyq cronie exa ffmpegthumbnailer fftw fortune-mod fzf git hsetroot htop imagemagick lxappearance mlocate ncurses neofetch neovim picom poppler python python-pip python3 ranger rofi scrot xdotool xsel xsettingsd zip zsh &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install additional packages!\e[0m\n' 

# Install yay (AUR Helper)
# Use my PKGBUILD, which removes the `sudo` dependency
printf '\e[1;4m Installing yay (AUR Helper)...\e[0m\n'
cd $pkgbuilddir
#git clone https://aur.archlinux.org/yay.git &&
	cd yay &&
	makepkg -Csi &&
	printf '\e[1;42m Success!\e[0m\n' || 
	printf '\e[1;41m Error! Could not install yay!\e[0m\n' 

# Install ranger configuration dependencies 
printf '\e[1;4m Installing ranger configuration dependencies...\e[0m\n'
cd $dotfilesdir
$root pip3 install --upgrade ueberzug pillow &&
	git clone https://github.com/marianosimone/epub-thumbnailer &&
	cd epub-thumbnailer && $root python install.py install &&
	cd $dotfilesdir &&
	git clone https://github.com/sdushantha/fontpreview &&
	cd fontpreview && $root make clean install &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf "\e[1;41m Error! Could not install vifm\'s configurations or their dependencies!\e[0m\n" 

# Create directories for zsh plugins
printf '\e[1;4m Creating zsh plugin directories...\e[0m\n'
	mkdir -p $ZSRCDIR/{archlinux,colored-man-pages,fast-syntax-highlighting,gitfast,safe-paste,zsh-autosuggestions} &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not create zsh plugin directories!\e[0m\n'

# Temporarily download Oh-My-Zsh repo, to copy plugins
printf '\e[1;4m Temporarily cloning Oh-My-Zsh...\e[0m\n'
	git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh $ZSRCDIR/ohmyzsh &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not clone repo!\e[0m\n'

# Install zsh plugins 
printf '\e[1;4m Installing zsh plugins...\e[0m\n'
	# ArchLinux integration
	mv $ZSRCDIR/ohmyzsh/plugins/archlinux $ZSRCDIR/archlinux &&
	# Colored Man Pages
	mv $ZSRCDIR/ohmyzsh/plugins/colored-man-pages $ZSRCDIR/colored-man-pages &&
	# Fast Syntax Highlighting
	git clone https://github.com/zdharma/fast-syntax-highlighting $ZSRCDIR/fast-syntax-highlighting &&
	# Fast git Syntax Highlighting
	mv $ZSRCDIR/ohmyzsh/plugins/gitfast $ZSRCDIR/gitfast &&
	# Safe Paste (don't run commands when pasting)
	mv $ZSRCDIR/ohmyzsh/plugins/safe-paste $ZSRCDIR/safe-paste &&
	# Zsh-Autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSRCDIR/zsh-autosuggestions &&
	echo "Removing Oh-My-Zsh repo..." &&
	rm -rf $ZSRCDIR/ohmyzsh &&
	echo "Making zsh the default shell..." &&
	chsh -s /bin/zsh &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install zsh plugins!\e[0m\n'

# Install xautolock and LightDM 
printf '\e[1;4m Installing xautolock and LightDM...\e[0m\n'
$root pacman -S --needed xautolock lightdm lightdm-openrc &&
	yay -S lightdm-webkit2-greeter saluto-lightdm-theme-dwm &&
	$root rc-update add lightdm default &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install xautolock or lightdm!\e[0m\n' 

# Install vim plugins 
printf '\e[1;4m Installing vim plugins...\e[0m\n'
cd $dotfilesdir
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
	mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle &&
	printf '\e[1;42m Success! Now please open vim and run :PlugInstall\e[0m\n' ||
	printf '\e[1;41m Error! Could not install the necessary vim plugins!\e[0m\n' 

# Install st (suckless terminal) 
# Use my PKGBUILD
printf '\e[1;4m Installing st (suckless terminal)...\e[0m\n'
cd $pkgbuilddir &&
	cd "st-matteo" &&
	makepkg -Csi
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install st!\e[0m\n' 

# Install sxiv (suckless X image viewer) 
# Use my PKGBUILD
printf '\e[1;4m Installing sxiv (suckless X image viewer)...\e[0m\n'
cd $pkgbuilddir &&
	cd "sxiv" &&
	makepkg -Csi
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install st!\e[0m\n' 

# Install required fonts 
printf '\e[1;4m Installing required fonts...\e[0m\n'
yay -S --norebuild --noredownload libxft-bgra-git noto-fonts powerline-fonts libertinus-font ttf-joypixels ttf-meslo-nerd-font-powerlevel10k unicode-emoji &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install the required fonts!\e[0m\n' 

# Install fzf 
printf '\e[1;4m Installing fzf...\e[0m\n'
cd $HOME/.config &&
	git clone https://github.com/junegunn/fzf &&
	printf '\e[1;4m FZF: Please accept both choices by typing "y" two times! DO NOT update your shell configuration!\e[0m\n' &&
	./fzf/install &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install fzf!\e[0m\n'

# Install various cpu tools 
printf '\e[1;4m Installing intel-undervolt...\e[0m\n' &&
	cd $dotfilesdir &&
	git clone https://github.com/kitsunyan/intel-undervolt &&
	cd intel-undervolt &&
	./configure --enable-elogind --enable-openrc &&
	make &&
	$root make install &&
	$root rc-update add intel-undervolt-loop default &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install intel-undervolt!\e[0m\n'

printf '\e[1;4m Installing cpupower...\e[0m\n' &&
	yay -S cpupower cpupower-openrc cpupower-gui &&
	$root rc-update add cpupower default &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install cpupower!\e[0m\n'

# Copy configurations 
printf '\e[1;4m Copying configurations...\e[0m\n'
cd $dotfilesdir/dotfiles &&
	cd dotfiles &&
	cp -r .aliases .config .vimrc .vim .zshrc .xinitrc .xprofile .Xresources .zshrc .fzf.zsh .local $HOME &&
	cp -r wallpapers $HOME &&
	printf '\e[1;42m Success!\[0m\n' ||
	printf '\e[1;41m Error! Could not copy configurations!\e[0m\n' 

# Install dwm and dwmblocks
printf '\e[1;4m Installing dwm and dwmblocks...\e[0m\n'
cd $dotfilesdir/dotfiles &&
	cd dwm && $root make clean install &&
	cd dwmblocks && $root make clean install &&
	printf '\e[1;42m Success!\[0m\n' ||
	printf '\e[1;41m Error! Could install dwm and/or dwmblocks!\e[0m\n' 

# Install slock 
printf '\e[1;4m Installing slock...\e[0m\n'
cd $dotfilesdir/dotfiles/slock &&
	$root make clean install &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install slock!\e[0m\n' 

# Successfully set up dotfiles
printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|
@ https://github.com/saloniamatteo/dotfiles
\e[1;42mThe installation finished without errors!\e[0m\n
\e[1;40mDon't worry if Vim/Neovim spits out some errors the first time you open it, but remember to run ':PlugInstall', then ':UpdateRemotePlugins'!\e[0m\n
\e[1;40mPlease add the following line to your crontab (by running 'crontab -e'):\n* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$UID ~/.config/scripts/bat-warn\e[0m\n
"
