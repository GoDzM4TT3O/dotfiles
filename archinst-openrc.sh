#!/usr/bin/bash
# GoDzM4TT3O's dotfiles
# Arch Linux installer
# This installer works on distributions based on Arch Linux
# NOTE: This is the OpenRC version. If you use Arch/Manjaro, DON'T use this script!
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

  ___                   ____   ____ 
 / _ \ _ __   ___ _ __ |  _ \ / ___|
| | | | '_ \ / _ \ '_ \| |_) | |    
| |_| | |_) |  __/ | | |  _ <| |___ 
 \___/| .__/ \___|_| |_|_| \_\\\____| version (for Artix/Gentoo)
      |_|                           

@ https://github.com/GoDzM4TT3O/dotfiles
Starting installation...
"

# Check for available updates
printf '\e[1;4m Checking for updates...\e[0m\n'
sudo pacman -Syu && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not check for updates!\e[0m\n' 

# Install necessary packages
printf '\e[1;4m Installing necessary packages...\e[0m\n'
sudo pacman -S --needed base-devel i3-gaps dmenu dunst i3lock i3status && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install necessary packages!\e[0m\n' 

# Install additional packages 
printf '\e[1;4m Installing additional packages...\e[0m\n'
sudo pacman -S cronie python pandoc zip throttled htop copyq git fortune-mod picom hsetroot exa zsh xsel rofi noto-fonts xsettingsd lxappearance scrot ttf-font-awesome ttf-fira-code vifm python-pip python3 ffmpegthumbnailer poppler imagemagick xdotool fzf sxiv ncurses fftw cmake vim neovim && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install additional packages!\e[0m\n' 

# Install yay (AUR Helper) 
printf '\e[1;4m Installing yay (AUR Helper)...\e[0m\n'
cd ~; git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install yay!\e[0m\n' 

# Install vifm configuration dependencies 
printf '\e[1;4m Installing vifm configuration dependencies...\e[0m\n'
cd ~; sudo pip3 install --upgrade ueberzug pillow && git clone https://github.com/marianosimone/epub-thumbnailer && cd epub-thumbnailer && sudo python install.py install && cd ~ && git clone https://github.com/sdushantha/fontpreview && cd fontpreview && sudo make install && cd ~/dotfiles/.config/vifm && chmod 777 vifmrun && cd scripts && chmod 777 vifmimg && sudo cp ~/dotfiles/.config/vifm/vifmrun /usr/bin && printf '\e[1;42m Success!\e[0m\n' || printf "\e[1;41m Error! Could not install vifm\'s configurations or their dependencies!\e[0m\n" 

# Install zsh plugins 
printf '\e[1;4m Installing oh-my-zsh...\e[0m\n'
curl -LO "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" && CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh ./install.sh && echo "Making zsh the default shell..." && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && chsh -s /bin/zsh && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install zsh plugins!\e[0m\n'

# Install xautolock and LightDM 
printf '\e[1;4m Installing xautolock and LightDM...\e[0m\n'
sudo pacman -S --needed xautolock lightdm displaymanager-openrc && yay -S lightdm-webkit2-greeter && sed -i 's/DISPLAYMANAGER="[a-zA-Z]*"/DISPLAYMANAGER="lightdm"/' /etc/conf.d/xdm  && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install xautolock or lightdm!\e[0m\n' 

# Install vim plugins 
printf '\e[1;4m Installing vim plugins...\e[0m\n'
cd ~; curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && mkdir -p ~/.vim/autoload ~/.vim/bundle && printf '\e[1;42m Success! Now please open vim and run :PlugInstall\e[0m\n' || printf '\e[1;41m Error! Could not install the necessary vim plugins!\e[0m\n' 

# Install networkmanager-dmenu 
printf '\e[1;4m Installing networkmanager-dmenu...\e[0m\n'
yay -S --norebuild --noredownload networkmanager-dmenu-git && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install networkmanager-dmenu!\e[0m\n' 

# Install slock 
printf '\e[1;4m Installing slock...\e[0m\n'
cd ~/dotfiles/slock && sudo make install && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install slock!\e[0m\n' 

# Install polybar 
printf '\e[1;4m Installing polybar...\e[0m\n'
yay -S --norebuild --noredownload polybar && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install polybar!\e[0m\n' 

# Install Powerlevel10k 
printf '\e[1;4m Installing Powerlevel10k...\e[0m\n'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install Powerlevel10k!\e[0m\n' 

# Install fast-syntax-highlighting 
printf '\e[1;4m Installing fast-syntax-highlighting...\e[0m\n'
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install fast-syntax-highlighting!\e[0m\n' 

# Install st (suckless terminal) 
printf '\e[1;4m Installing st (suckless terminal)...\e[0m\n'
yay -S --norebuild --noredownload st-luke-git && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install st!\e[0m\n' 

# Install required fonts 
printf '\e[1;4m Installing required fonts...\e[0m\n'
yay -S --norebuild --noredownload unicode-emoji libxft-bgra-git ttf-font-awesome ttf-meslo-nerd-font-powerlevel10k powerline-fonts ttf-joypixels otf-openmoji ttf-symbola && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install the required fonts!\e[0m\n' 

# Install fzf 
printf '\e[1;4m Installing fzf...\e[0m\n'
cd ~/.config && git clone https://github.com/junegunn/fzf && printf '\e[1;4m FZF: Please accept both choices by typing "y" two times! DO NOT update your shell configuration!\e[0m\n' && ./fzf/install && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install fzf!\e[0m\n'

# Install various cpu tools 
printf '\e[1;4m Do you have a ThinkPad?\n[y/n]\e[0m\n' && read answer
[[ $answer = "Y" || $answer = "y" ]] && printf '\e1;4m Installing ThinkPad-Fan-Control...\e[0m\n' && cd && git clone https://github.com/ForgedTurbo/ThinkPad-Fan-Control && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install ThinkPad-Fan-Control!\e[0m\n'
[[ $answer = "N" || $answer = "n" ]] && printf '\e1;41m Not installing ThinkPad-Fan-Control...\e[0m\n'
printf '\e[1;4m Installing cpuface...\e[0m\n' && cd && git clone https://github.com/kitsunyan/intel-undervolt && cd intel-undervolt && ./configure --enable-elogind --enable-openrc && make && sudo make install && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install cpuface!\e[0m\n'
printf '\e[1;4m Installing intel-undervolt...\e[0m\n' && sudo pacman -S intel-undervolt && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install intel-undervolt!\e[0m\n'

# Install saluto-lightdm-theme-dwm
printf '\e[1;4m Installing saluto-lightdm-theme-dwm...\e[0m\n' && yay -S saluto-lightdm-theme-dwm && printf '\e[1;42m Success!\e[0m\n' || printf '\e[1;41m Error! Could not install saluto-lightdm-theme-dwm!\e[0m\n'

# Copy configurations 
printf '\e[1;4m Copying configurations...\e[0m\n'
cd; git clone https://github.com/GoDzM4TT3O/dotfiles && cd dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*,*.zsh,local,cpuface_profiles.json} $HOME && cp -r {wallpaper*,archlogo.txt,italiarch.png} $HOME && printf '\e[1;42m Success!\[0m\n' || printf '\e[1;41m Error! Could not copy configurations!\e[0m\n' 

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
\e[1;40mPlease add the following line to your crontab (by running 'crontab -e'):\n* * * * * DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 ~/.config/scripts/bat-warn\e[0m\n
"
