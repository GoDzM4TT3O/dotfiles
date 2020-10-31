#!/usr/bin/bash
# GoDzM4TT3O's dotfiles
# Arch Linux installer
# This installer works on distributions based on Arch Linux
# NOTE: This is the Systemd version. If you use Arch/Manjaro, USE this script!
# You shouldn't run this as root.
# When required, enter your password for sudo.

# Check if root
! [[ "$EUID" -ne 0 ]] && printf '\e[1;41m[ERROR] DO NOT RUN AS ROOT!\e[0m\n' && exit

printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|

 ____            _                     _ 
/ ___| _   _ ___| |_ ___ _ __ ___   __| |
\___ \| | | / __| __/ _ \ '_ ' _ \ / _' |
 ___) | |_| \__ \ ||  __/ | | | | | (_| |
|____/ \__, |___/\__\___|_| |_| |_|\__,_| version (for Arch Linux/Manjaro)
       |___/                             

@ https://github.com/GoDzM4TT3O/dotfiles
Starting installation...
"

# Check for available updates [1]
printf '\e[1;4m[1] Checking for updates...\e[0m\n'
sudo pacman -Syu && printf '\e[1;42m[1] Success!\e[0m\n' || printf '\e[1;41m[1] Error! Could not check for updates!\e[0m\n' 

# Install necessary packages [2]
printf '\e[1;4m[2] Installing necessary packages...\e[0m\n'
sudo pacman -S --needed base-devel i3-gaps dmenu dunst i3lock i3status && printf '\e[1;42m[2] Success!\e[0m\n' || printf '\e[1;41m[2] Error! Could not install necessary packages!\e[0m\n' 

# Install additional packages [3]
printf '\e[1;4m[3] Installing additional packages...\e[0m\n'
sudo pacman -S throttled htop copyq git fortune-mod picom hsetroot exa zsh xsel rofi noto-fonts xsettingsd lxappearance scrot feh kitty xorg-xinit ttf-font-awesome ttf-fira-code vifm neofetch python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses neovim fftw cmake vim vifm && printf '\e[1;42m[3] Success!\e[0m\n' || printf '\e[1;41m[3] Error! Could not install additional packages!\e[0m\n' 

# Install yay (AUR Helper) [4]
printf '\e[1;4m[4] Installing yay (AUR Helper)...\e[0m\n'
cd ~; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && printf '\e[1;42m[4] Success!\e[0m\n' || printf '\e[1;41m[4] Error! Could not install yay!\e[0m\n' 

# Install tty-clock [5]
printf '\e[1;4m[5] Installing tty-clock...\e[0m\n'
yay -S --norebuild --noredownload tty-clock && printf '\e[1;42m[5] Success!\e[0m\n' || printf '\e[1;41m[5] Error! Could not install tty-clock!\e[0m\n' 

# Install vifm configuration dependencies [6]
printf '\e[1;4m[6] Installing vifm configuration dependencies...\e[0m\n'
cd ~; sudo pip3 install --upgrade ueberzug pillow && git clone https://github.com/marianosimone/epub-thumbnailer && cd epub-thumbnailer && sudo python install.py install && cd ~ && git clone https://github.com/sdushantha/fontpreview && cd fontpreview && sudo make install && cd ~/dotfiles/.config/vifm && chmod 777 vifmrun && cd scripts && chmod 777 vifmimg && sudo cp ~/dotfiles/.config/vifm/vifmrun /usr/bin && printf '\e[1;42m[6] Success!\e[0m\n' || printf "\e[1;41m[6] Error! Could not install vifm\'s configurations or their dependencies!\e[0m\n" 

# Install zsh plugins [7]
printf '\e[1;4m[7] Installing oh-my-zsh...\e[0m\n'
curl -LO "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" && CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh ./install.sh && echo "Making zsh the default shell..." && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && chsh -s /bin/zsh && printf '\e[1;42m[7] Success!\e[0m\n' || printf '\e[1;41m[7] Error! Could not install zsh plugins!\e[0m\n'

# Install shell-color-scripts [8]
printf '\e[1;4m[8] Installing shell-color-scripts...\e[0m\n'
yay -S --norebuild --noredownload shell-color-scripts && printf '\e[1;42m[8] Success!\e[0m\n' || printf '\e[1;41m[8] Error! Could not install shell-color-scripts!\e[0m\n' 

# Install xautolock and LightDM [9]
printf '\e[1;4m[9] Installing xautolock and LightDM...\e[0m\n'
sudo pacman -S --needed xautolock lightdm && yay -S lightdm-webkit2-greeter && sudo systemctl enable lightdm && printf '\e[1;42m[9] Success!\e[0m\n' || printf '\e[1;41m[9] Error! Could not install xautolock or lightdm!\e[0m\n' 

# Disable other display managers (allowed to fail) [9]
sudo systemctl disable gdm && printf '\e[1;42m[9] Successfully disabled gdm!\e[0m\n' || printf "\e[1;41m[9] Could not disable GDM (don't worry!)\e[0m\n"
sudo systemctl disable sddm && printf '\e[1;42m[9] Successfully disabled sddm!\e[0m\n' || printf "\e[1;41m[9] Could not disable SDDM (don't worry!)\e[0m\n"
sudo systemctl disable lxdm && printf '\e[1;42m[9] Successfully disabled lxdm!\e[0m\n' || printf "\e[1;41m[9] Could not disable LXDM (don't worry!)\e[0m\n"

# Install cli-visualizer [10]
printf '\e[1;4m[10] Installing cli-visualizer...\e[0m\n'
cd ~; git clone https://github.com/dpayne/cli-visualizer && cd cli-visualizer && ./install.sh && printf '\e[1;42m[10] Success!\e[0m\n' || printf '\e[1;41m[10] Error! Could not install cli-visualizer!\e[0m\n' 

# Install vim plugins [11]
printf '\e[1;4m[11] Installing vim plugins...\e[0m\n'
cd ~; curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && mkdir -p ~/.vim/autoload ~/.vim/bundle && printf '\e[1;42m[11] Success! Now please open vim and run :PlugInstall\e[0m\n' || printf '\e[1;41m[11] Error! Could not install the necessary vim plugins!\e[0m\n' 

# Install networkmanager-dmenu [12]
printf '\e[1;4m[12] Installing networkmanager-dmenu...\e[0m\n'
yay -S --norebuild --noredownload networkmanager-dmenu-git && printf '\e[1;42m[12] Success!\e[0m\n' || printf '\e[1;41m[12] Error! Could not install networkmanager-dmenu!\e[0m\n' 

# Install slock [13]
printf '\e[1;4m[13] Installing slock...\e[0m\n'
cd ~/dotfiles/slock && sudo make install && printf '\e[1;42m[13] Success!\e[0m\n' || printf '\e[1;41m[13] Error! Could not install slock!\e[0m\n' 

# Install polybar [14]
printf '\e[1;4m[14] Installing polybar...\e[0m\n'
yay -S --norebuild --noredownload polybar && printf '\e[1;42m[14] Success!\e[0m\n' || printf '\e[1;41m[14] Error! Could not install polybar!\e[0m\n' 

# Install Powerlevel10k [15]
printf '\e[1;4m[15] Installing Powerlevel10k...\e[0m\n'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k && printf '\e[1;42m[15] Success!\e[0m\n' || printf '\e[1;41m[15] Error! Could not install Powerlevel10k!\e[0m\n' 

# Install fast-syntax-highlighting [16]
printf '\e[1;4m[16] Installing fast-syntax-highlighting...\e[0m\n'
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting && printf '\e[1;42m[16] Success!\e[0m\n' || printf '\e[1;41m[16] Error! Could not install fast-syntax-highlighting!\e[0m\n' 

# Install newsboat [17]
printf '\e[1;4m[17] Installing newsboat...\e[0m\n'
sudo pacman -S --needed newsboat urlscan && printf '\e[1;42m[17] Success!\e[0m\n' || printf '\e[1;41m[17] Error! Could not install newsboat!\e[0m\n' 

# Install st (suckless terminal) [18]
printf '\e[1;4m[18] Installing st (suckless terminal)...\e[0m\n'
yay -S --norebuild --noredownload st-luke-git && printf '\e[1;42m[18] Success!\e[0m\n' || printf '\e[1;41m[18] Error! Could not install st!\e[0m\n' 

# Install required fonts [19]
printf '\e[1;4m[19] Installing required fonts...\e[0m\n'
yay -S --norebuild --noredownload unicode-emoji libxft-bgra-git ttf-font-awesome ttf-meslo-nerd-font-powerlevel10k powerline-fonts ttf-joypixels otf-openmoji ttf-symbola && printf '\e[1;42m[19] Success!\e[0m\n' || printf '\e[1;41m[19] Error! Could not install the required fonts!\e[0m\n' 

# Install fzf [20]
printf '\e[1;4m[20] Installing fzf...\e[0m\n'
cd ~/.config && git clone https://github.com/junegunn/fzf && printf '\e[1;4m[20] FZF: Please accept both choices by typing "y" two times! DO NOT update your shell configuration!\e[0m\n' && ./fzf/install && printf '\e[1;42m[20] Success!\e[0m\n' || printf '\e[1;41m[20] Error! Could not install fzf!\e[0m\n'

# Intstall various cpu tools [21]
printf '\e[1;4m[21] Do you have a ThinkPad?\n[y/n]\e[0m\n' && read answer
[[ $answer = "Y" || $answer = "y" ]] && printf '\e1;4m[21] Installing ThinkPad-Fan-Control...\e[0m\n' && cd && git clone https://github.com/ForgedTurbo/ThinkPad-Fan-Control && printf '\e[1;42m[21] Success!\e[0m\n' || printf '\e[1;41m[21] Error! Could not install ThinkPad-Fan-Control!\e[0m\n'
[[ $answer = "N" || $answer = "n" ]] && printf '\e1;41m[21] Not installing ThinkPad-Fan-Control...\e[0m\n'
printf '\e[1;4m[21] Installing cpuface...\e[0m\n' && yay -S cpuface-git && printf '\e[1;42m[21] Success!\e[0m\n' || printf '\e[1;41m[21] Error! Could not install cpuface!\e[0m\n'
printf '\e[1;4m[21] Installing intel-undervolt...\e[0m\n' && sudo pacman -S intel-undervolt && printf '\e[1;42m[21] Success!\e[0m\n' || printf '\e[1;41m[21] Error! Could not install intel-undervolt!\e[0m\n'

# Copy configurations [22]
printf '\e[1;4m[22] Copying configurations...\e[0m\n'
cd ~; git clone https://github.com/GoDzM4TT3O/dotfiles && cd dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*,*.zsh,local} $HOME && cp -r {wallpaper*,archlogo.txt,italiarch.png} $HOME && cp .cpuface_profiles.json $HOME && printf '\e[1;42m[22] Success!\e[0m\n' || printf '\e[1;41m[22] Error! Could not copy configurations!\e[0m\n' 

# Successfully set up dotfiles
printf "
    _             _     ___           _    
   / \   _ __ ___| |__ |_ _|_ __  ___| |_
  / _ \ | '__/ __| '_ \ | || '_ \/ __| __|
 / ___ \| | | (__| | | || || | | \__ \ |_
/_/   \_\_|  \___|_| |_|___|_| |_|___/\__|
@ https://github.com/GoDzM4TT3O/dotfiles
\e[1;42mThe installation finished without errors! It is recommended you modify "~/.config/polybar/config" following the guide over at https://godzm4tt3o.js.org/dotfiles/#modifying-configurations\e[0m\n
\e[1;40mDon't worry if Vim/Neovim spits out some errors the first time you open it, but remember to run ':PlugInstall'!\e[0m\n
"
