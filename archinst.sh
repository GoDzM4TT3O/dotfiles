#!/usr/bin/env bash
# GoDzM4TT3O's dotfiles
# Arch Linux installer
# This installer works on distributions based on Arch Linux
# You shouldn't run this as root.
# When required, enter your password for sudo.

# Check if root
if ! [ "$EUID" -ne 0 ]
then
	printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n'; exit
	exit
fi


# Check for available updates [1]
printf '\e[1;4m[1] Checking for updates...\e[0m\n'
sudo pacman -Syu
if [ $? -eq 0 ]; then
    printf '\e[1;42m[1] Success!\e[0m\n'
else
    printf '\e[1;41m[1] Error! Could not check for updates!\e[0m\n'; exit
fi


# Install necessary packages [2]
printf '\e[1;4m[2] Installing necessary packages...\e[0m\n'
sudo pacman -S i3-wm dunst i3lock i3status
if [ $? -eq 0 ]; then
	printf '\e[1;42m[2] Success!\e[0m\n'
else
	printf '\e[1;41m[2] Error! Could not install necessary packages!\e[0m\n'; exit
fi


# Install additional packages [3]
printf '\e[1;4m[3] Installing additional packages...\e[0m\n'
sudo pacman -S git compton hsetroot zsh rxvt-unicode xsel rofi noto-fonts xsettingsd lxappearance scrot viewnior cmus feh kitty xorg-xinit ttf-font-awesome ttf-fira-code vifm neofetch python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses fftw cmake
if [ $? -eq 0 ]; then
	printf '\e[1;42m[3] Success!\e[0m\n'
else
	printf '\e[1;41m[3] Error! Could not install additional packages!\e[0m\n'; exit
fi


# Install yay (AUR Helper) [4]
printf '\e[1;4m[4] Installing yay (AUR Helper)...\e[0m\n'
cd ~; git clone https://aur.archlinux.org/yay.git; cd yay; makepkg -si
if [ $? -eq 0 ]; then
	printf '\e[1;42m[4] Success!\e[0m\n'
else
	printf '\e[1;41m[4] Error! Could not install yay!\e[0m\n'; exit
fi

# Install tty-clock [5]
printf '\e[1;4m[5] Installing tty-clock...\e[0m\n'
yay -S tty-clock
if [ $? -eq 0 ]; then
	printf '\e[1;42m[5] Success!\e[0m\n'
else    
	printf '\e[1;41m[5] Error! Could not install tty-clock!\e[0m\n'; exit
fi

# Copy configurations [6]
printf '\e[1;4m[6] Copying configurations...\e[0m\n'
cd ~; git clone https://github.com/GoDzM4TT3O/dotfiles;cd dotfiles; cp -r .{config,vim*,z*,x*,X*} ~; cp -r {wallpaper*,archlogo.txt,randomwall.sh} ~; cp {u,}mount ~
cp {u,}mount ~ # copy mount/unmount scripts
if [ $? -eq 0 ]; then
	printf '\e[1;42m[6] Success!\e[0m\n'
else
	printf '\e[1;41m[6] Error! Could not copy configurations!\e[0m\n'; exit
fi

# Install vifm configuration dependencies [7]
printf '\e[1;4m[7] Installing vifm configuration dependencies...\e[0m\n'
cd ~; sudo pip3 install ueberzug pillow; git clone https://github.com/marianosimone/epub-thumbnailer; cd epub-thumbnailer; sudo python install.py install; cd ~; git clone https://github.com/sdushantha/fontpreview; cd fontpreview; sudo make install; cd ~/dotfiles/.config/vifm; chmod 777 {vifmrun,scripts/vifmimg}; sudo cp ~/dotfiles/.config/vifm/vifmrun /usr/bin
if [ $? -eq 0 ]; then
	printf '\e[1;42m[7] Success!\e[0m\n'
else
	printf "\e[1;41m[7] Error! Could not install vifm\'s configurations or their dependencies!\e[0m\n"; exit
fi

# Install zsh plugins [8]
printf '\e[1;4m[8] Installing oh-my-zsh...\e[0m\n'
yay -S oh-my-zsh-git && echo "Making zsh the default shell..." && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && chsh -s /bin/zsh
if [ $? -eq 0 ]; then
	printf '\e[1;42m[8] Success!\e[0m\n'
else
	printf '\e[1;41m[8] Error! Could not install zsh plugins!\e[0m\n'; exit
fi

# Install shell-color-scripts [9]
# Thankfully, the package is available from the AUR
printf '\e[1;4m[9] Installing shell-color-scripts...\e[0m\n'
yay -S shell-color-scripts
if [ $? -eq 0 ]; then
	printf '\e[1;42m[9] Success!\e[0m\n'
else
	printf '\e[1;41m[9] Error! Could not install shell-color-scripts!\e[0m\n'; exit
fi

# Install xautolock and LightDM [10]
printf '\e[1;4m[10] Installing xautolock and LightDM...\e[0m\n'
sudo pacman -S xautolock lightdm; yay -S lightdm-webkit2-greeter; sudo systemctl enable lightdm
if [ $? -eq 0 ]; then
	printf '\e[1;42m[10] Success!\e[0m\n'
else
	printf '\e[1;41m[10] Error! Could not install xautolock or lightdm!\e[0m\n'; exit
fi

# Disable other display managers (allowed to fail)
sudo systemctl disable {gdm,sddm,lxdm}

# Install cli-visualizer [11]
printf '\e[1;4m[11] Installing cli-visualizer...\e[0m\n'
cd ~; git clone https://github.com/dpayne/cli-visualizer; cd cli-visualizer; ./install.sh
if [ $? -eq 0 ]; then
	printf '\e[1;42m[11] Success!\e[0m\n'
else
	printf '\e[1;41m[11] Error! Could not install cli-visualizer!\e[0m\n'; exit
fi

# Install vim plugins [12]
printf '\e[1;4m[12] Installing vim plugings...\e[0m\n'
cd ~; curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim; git clone https://github.com/vim-airline/vim-airline && mv vim-airline ~/.vim/bundle/vim-airline; git clone https://github.com/vim-airline/vim-airline-themes && mv vim-airline ~/.vim/bundle/vim-airline-themes
if [ $? -eq 0 ]; then
	printf '\e[1;42m[12] Success! Now please open vim and run :PlugInstall'
else
	printf '\e[1;41m[12] Error! Could not install the necessary vim plugins!\e[0m\n'; exit
fi

printf '\e[1;42mThe installation finished without errors! It is recommended you modify "~/.config/i3status/config" following the guide over at https://godzm4tt3o.js.org/dotfiles/#modifying-configurations\e[0m\n'
