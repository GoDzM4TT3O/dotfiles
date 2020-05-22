#!/usr/bin/bash
# GoDzM4TT3O's dotfiles
# Arch Linux installer
# This installer works on distributions based on Arch Linux
# You shouldn't run this as root.
# When required, enter your password for sudo.

# Check if root
! [[ "$EUID" -ne 0 ]] && printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n'; exit

printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|
@ https://github.com/GoDzM4TT3O/dotfiles
Starting installation...
"

# Check for available updates [1]
printf '\e[1;4m[1] Checking for updates...\e[0m\n'
sudo pacman -Syu && printf '\e[1;42m[1] Success!\e[0m\n' || printf '\e[1;41m[1] Error! Could not check for updates!\e[0m\n'; exit

# Install necessary packages [2]
printf '\e[1;4m[2] Installing necessary packages...\e[0m\n'
sudo pacman -S i3-wm dunst i3lock i3status && printf '\e[1;42m[2] Success!\e[0m\n' || printf '\e[1;41m[2] Error! Could not install necessary packages!\e[0m\n'; exit

# Install additional packages [3]
printf '\e[1;4m[3] Installing additional packages...\e[0m\n'
sudo pacman -S git compton hsetroot zsh rxvt-unicode xsel rofi noto-fonts xsettingsd lxappearance scrot viewnior cmus feh kitty xorg-xinit ttf-font-awesome ttf-fira-code vifm neofetch python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses fftw cmake && printf '\e[1;42m[3] Success!\e[0m\n' || printf '\e[1;41m[3] Error! Could not install additional packages!\e[0m\n'; exit

# Install yay (AUR Helper) [4]
printf '\e[1;4m[4] Installing yay (AUR Helper)...\e[0m\n'
cd ~; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && printf '\e[1;42m[4] Success!\e[0m\n' || printf '\e[1;41m[4] Error! Could not install yay!\e[0m\n'; exit

# Install tty-clock [5]
printf '\e[1;4m[5] Installing tty-clock...\e[0m\n'
yay -S tty-clock && printf '\e[1;42m[5] Success!\e[0m\n' || printf '\e[1;41m[5] Error! Could not install tty-clock!\e[0m\n'; exit

# Copy configurations [6]
printf '\e[1;4m[6] Copying configurations...\e[0m\n'
cd ~; git clone https://github.com/GoDzM4TT3O/dotfiles && cd dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*} ~ && cp -r {wallpaper*,archlogo.txt,randomwall.sh} ~ && cp {u,}mount ~ && printf '\e[1;42m[6] Success!\e[0m\n' || printf '\e[1;41m[6] Error! Could not copy configurations!\e[0m\n'; exit

# Install vifm configuration dependencies [7]
printf '\e[1;4m[7] Installing vifm configuration dependencies...\e[0m\n'
cd ~; sudo pip3 install ueberzug pillow && git clone https://github.com/marianosimone/epub-thumbnailer && cd epub-thumbnailer && sudo python install.py install && cd ~ && git clone https://github.com/sdushantha/fontpreview && cd fontpreview && sudo make install && cd ~/dotfiles/.config/vifm && chmod 777 vifmrun && cd scripts && chmod 777 vifmimg && sudo cp ~/dotfiles/.config/vifm/vifmrun /usr/bin && printf '\e[1;42m[7] Success!\e[0m\n' || printf "\e[1;41m[7] Error! Could not install vifm\'s configurations or their dependencies!\e[0m\n"; exit

# Install zsh plugins [8]
printf '\e[1;4m[8] Installing oh-my-zsh...\e[0m\n'
yay -S oh-my-zsh-git && echo "Making zsh the default shell..." && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && chsh -s /bin/zsh && printf '\e[1;42m[8] Success!\e[0m\n' || printf '\e[1;41m[8] Error! Could not install zsh plugins!\e[0m\n'; exit

# Install shell-color-scripts [9]
printf '\e[1;4m[9] Installing shell-color-scripts...\e[0m\n'
yay -S shell-color-scripts && printf '\e[1;42m[9] Success!\e[0m\n' || printf '\e[1;41m[9] Error! Could not install shell-color-scripts!\e[0m\n'; exit

# Install xautolock and LightDM [10]
printf '\e[1;4m[10] Installing xautolock and LightDM...\e[0m\n'
sudo pacman -S xautolock lightdm && yay -S lightdm-webkit2-greeter && sudo systemctl enable lightdm && printf '\e[1;42m[10] Success!\e[0m\n' || printf '\e[1;41m[10] Error! Could not install xautolock or lightdm!\e[0m\n'; exit

# Disable other display managers (allowed to fail) [10]
sudo systemctl disable gdm && printf '\e[1;42m[10] Successfully disabled gdm!\e[0m\n' || printf "\e[1;41m[10] Could not disable GDM (don't worry!)\e[0m\n"
sudo systemctl disable sddm && printf '\e[1;42m[10] Successfully disabled sddm!\e[0m\n' || printf "\e[1;41m[10] Could not disable SDDM (don't worry!)\e[0m\n"
sudo systemctl disable lxdm && printf '\e[1;42m[10] Successfully disabled lxdm!\e[0m\n' || printf "\e[1;41m[10] Could not disable LXDM (don't worry!)\e[0m\n"

# Install cli-visualizer [11]
printf '\e[1;4m[11] Installing cli-visualizer...\e[0m\n'
cd ~; git clone https://github.com/dpayne/cli-visualizer && cd cli-visualizer && ./install.sh && printf '\e[1;42m[11] Success!\e[0m\n' || printf '\e[1;41m[11] Error! Could not install cli-visualizer!\e[0m\n'; exit

# Install vim plugins [12]
printf '\e[1;4m[12] Installing vim plugins...\e[0m\n'
cd ~; curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && git clone https://github.com/vim-airline/vim-airline && mv vim-airline ~/.vim/bundle/vim-airline && git clone https://github.com/vim-airline/vim-airline-themes && mv vim-airline ~/.vim/bundle/vim-airline-themes && printf '\e[1;42m[12] Success! Now please open vim and run :PlugInstall' || printf '\e[1;41m[12] Error! Could not install the necessary vim plugins!\e[0m\n'; exit

# Install networkmanager-dmenu [13]
printf '\e[1;4m[13] Installing networkmanager-dmenu...\e[0m\n'
yay -S networkmanager-dmenu-git && printf '\e[1;42m[13] Success!\e[0m\n' || printf '\e[1;41m[13] Error! Could not install networkmanager-dmenu!\e[0m\n'; exit

# Install slock [14]
printf '\e[1;4m[14] Installing slock...\e[0m\n'
cd ~/dotfiles/slock && sudo make install && printf '\e[1;42m[14] Success!\e[0m\n' || printf '\e[1;41m[14] Error! Could not install slock!\e[0m\n'; exit

printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|
@ https://github.com/GoDzM4TT3O/dotfiles
\e[1;42mThe installation finished without errors! It is recommended you modify "~/.config/i3status/config" following the guide over at https://godzm4tt3o.js.org/dotfiles/#modifying-configurations\e[0m\n
"
