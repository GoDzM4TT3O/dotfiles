#!/usr/bin/bash
# saloniamatteo's dotfiles
# This installer works on distributions based on Gentoo
# You shouldn't run this as root.
# When required, enter your password for doas/sudo.

# Check if root
[ "$EUID" -eq 0 ] && printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n' && exit 1

# Check if `doas` is installed.
# If it is, prefer it to `sudo`
if ! [ -z $(which doas) ]; then
	root=doas 
else if ! [ -z $(which sudo) ]; then
	root=sudo
else
	printf "Unable to find doas and/or sudo! Exiting..." && exit 2
fi
fi

# Use "~/Documents/dotfiles" to store everything that is going to be downloaded
dotfilesdir="$HOME/Documents/dotfiles"

# Use "~/Documents/dotfiles/pkgbuilds" my PKGBUILDS 
pkgbuilddir="$HOME/Documents/dotfiles/pkgbuilddir"

# If the directories above do not exist, create them,
[ ! -d "$dotfilesdir" ] && mkdir -p "$dotfilesdir"

# Clone my dotfiles & PKGBUILDS repository there.
[ ! -d "$dotfilesdir/dotfiles" ] && git clone https://github.com/saloniamatteo/dotfiles "$dotfilesdir/dotfiles"

printf "
  ____            _
 / ___| ___ _ __ | |_ ___   ___
| |  _ / _ \ '_ \| __/ _ \ / _ \
| |_| |  __/ | | | || (_) | (_) |
 \____|\___|_| |_|\__\___/ \___/ install script

@ https://github.com/saloniamatteo/dotfiles
Starting installation...
"

# Update repositories (don't run system upgrade)
printf '\e[1;4m Updating repositories...\e[0m\n'
$root emerge --sync &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not check for updates!\e[0m\n' 

# Packages not included:
# ffmpegthumbnailer fftw fzf pip ranger

# Install packages
printf '\e[1;4m Installing packages...\e[0m\n'
$root emerge app-arch/zip app-editors/neovim app-misc/neofetch app-shells/{bash,bash-completion,gentoo-bashcomp} app-text/poppler dev-lang/python dev-util/cmake dev-vcs/git games-misc/fortune-mod lxde-base/lxappearance media-gfx/{imagemagick,scrot,sxiv} net-misc/curl sys-apps/{exa,mlocate} sys-libs/ncurses sys-process/{cronie,htop} x11-misc/{copyq,dmenu,dunst,hsetroot,rofi,picom,xdotool,xscreensaver,xsel,xsettingsd} x11-themes/neutral-xcursors &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install additional packages!\e[0m\n' 

# Install vim plugins 
printf '\e[1;4m Installing vim plugins...\e[0m\n'
cd $dotfilesdir
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
	mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle &&
	printf '\e[1;42m Success! Now please open vim and run :PlugInstall\e[0m\n' ||
	printf '\e[1;41m Error! Could not install the necessary vim plugins!\e[0m\n' 

# Install st (suckless terminal) 
printf '\e[1;4m Installing st (suckless terminal)...\e[0m\n'
cd $dotfilesdir &&
	git clone "https://github.com/saloniamatteo/st" &&
	make && $root make install &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install st!\e[0m\n' 

# Install required fonts 
printf '\e[1;4m Installing required fonts...\e[0m\n'
$root emerge media-fonts/{fira-code,libertine,noto,noto-emoji,powerline-symbols,terminus-font} &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install the required fonts!\e[0m\n' 

# Install various cpu tools 
printf '\e[1;4m Installing intel-undervolt...\e[0m\n' &&
$root emerge sys-power/intel-undervolt &&
	$root rc-update add intel-undervolt-loop default &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install intel-undervolt!\e[0m\n'

printf '\e[1;4m Installing cpupower...\e[0m\n' &&
$root emerge sys-power/cpupower &&
	$root rc-update add cpupower default &&
	printf '\e[1;42m Success!\e[0m\n' ||
	printf '\e[1;41m Error! Could not install cpupower!\e[0m\n'

# Copy configurations 
printf '\e[1;4m Copying configurations...\e[0m\n'
cd $dotfilesdir/dotfiles &&
	cd dotfiles &&
	cp .xinitrc-gentoo $HOME/.xinitrc &&
	cp .xprofile-gentoo $HOME/.xprofile &&
	cp -r .aliases .bashrc .config/ .ls-cols .inputrc .vimrc .vim/ .Xresources .local/ $HOME &&
	cp -r wallpapers $HOME &&
	printf '\e[1;42m Success!\[0m\n' ||
	printf '\e[1;41m Error! Could not copy configurations!\e[0m\n' 

# Install dwm and dwmblocks
printf '\e[1;4m Installing dwm and dwmblocks...\e[0m\n'
cd $dotfilesdir/dotfiles &&
	cd dwm && make clean && make && $root make install &&
	cd dwmblocks && make clean && make && $root make install &&
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
  ____            _
 / ___| ___ _ __ | |_ ___   ___
| |  _ / _ \ '_ \| __/ _ \ / _ \
| |_| |  __/ | | | || (_) | (_) |
 \____|\___|_| |_|\__\___/ \___/ install script

@ https://github.com/saloniamatteo/dotfiles
\e[1;42mThe installation finished without errors!\e[0m\n
\e[1;40mDon't worry if Vim/Neovim spits out some errors the first time you open it, but remember to run ':PlugInstall', then ':UpdateRemotePlugins'!\e[0m\n
\e[1;40mPlease add the following line to your crontab (by running 'crontab -e'):\n* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/$UID ~/.config/scripts/bat-warn\e[0m\n
"
