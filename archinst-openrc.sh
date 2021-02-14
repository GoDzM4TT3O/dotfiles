#!/usr/bin/bash
# GoDzM4TT3O's dotfiles
# This installer works on distributions based on Arch Linux
# NOTE: This is the OpenRC version. If you use Arch/Manjaro, DON'T use this script!
# You shouldn't run this as root.
# When required, enter your password for doas/sudo.

# Check if root
[ "$EUID" -eq 0 ] && printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n' && exit 1

# Check if `doas` is installed.
# If it is, prefer it to `sudo`
[ $(which doas) ] && root="doas" || root="sudo"

# Use "~/Documents/dotfiles" as a directory to store everything
# that is going to be downloaded, instead of cluttering $HOME.
dotfilesdir="$HOME/Documents/dotfiles"

# Use "~/Documents/dotfiles/pkgbuilds" as a directory to store my PKGBUILDS 
pkgbuilddir="$HOME/Documents/dotfiles/pkgbuilddir"

# If the directories above do not exist, create them,
[ ! -d "$dotfilesdir" ] && mkdir -p "$dotfilesdir"

# Clone my dotfiles & PKGBUILDS repository there.
[ ! -d "$dotfilesdir/dotfiles" ] && git clone https://github.com/GoDzM4TT3O/dotfiles "$dotfilesdir/dotfiles"
[ ! -d "$pkgbuilddir" ] && git clone https://github.com/GoDzM4TT3O/pkgbuilds "$pkgbuilddir"

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

@ https://github.com/GoDzM4TT3O/dotfiles
Starting installation...
"

# Check for available updates
printf '\e[1;4m Checking for updates...\e[0m\n'
$root pacman -Syu &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not check for updates!\e[0m\n' 

# Install necessary packages
printf '\e[1;4m Installing necessary packages...\e[0m\n'
$root pacman -S --needed base-devel dmenu dunst &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install necessary packages!\e[0m\n' 

# Install additional packages 
printf '\e[1;4m Installing additional packages...\e[0m\n'
$root pacman -S cmake copyq cronie exa ffmpegthumbnailer fftw fortune-mod fzf git hsetroot htop imagemagick lxappearance mlocate ncurses neofetch neovim picom poppler python python-pip python3 ranger rofi scrot xdotool xsel xsettingsd zip zsh &&
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

# Install zsh plugins 
printf '\e[1;4m Installing oh-my-zsh...\e[0m\n'
curl -LO "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" &&
	CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh ./install.sh &&
	echo "Making zsh the default shell..." &&
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
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

# Install Powerlevel10k 
printf '\e[1;4m Installing Powerlevel10k...\e[0m\n'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install Powerlevel10k!\e[0m\n' 

# Install fast-syntax-highlighting 
printf '\e[1;4m Installing fast-syntax-highlighting...\e[0m\n'
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install fast-syntax-highlighting!\e[0m\n' 

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
yay -S --norebuild --noredownload libxft-bgra-git noto-fonts powerline-fonts ttf-linux-libertine ttf-joypixels ttf-meslo-nerd-font-powerlevel10k unicode-emoji &&
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
	cp -r .aliases .config .vimrc .vim .zshrc .xinitrc .xprofile .Xresources .zshrc .fzf.zsh .p10k.zsh .local $HOME &&
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
@ https://github.com/GoDzM4TT3O/dotfiles
\e[1;42mThe installation finished without errors!\e[0m\n
\e[1;40mDon't worry if Vim/Neovim spits out some errors the first time you open it, but remember to run ':PlugInstall', then ':UpdateRemotePlugins'!\e[0m\n
\e[1;40mPlease add the following line to your crontab (by running 'crontab -e'):\n* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$UID ~/.config/scripts/bat-warn\e[0m\n
"
