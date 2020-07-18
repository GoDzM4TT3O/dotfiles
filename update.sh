#!/usr/bin/bash
# GoDzM4TT3O's dotfiles
# Ask the user if they already fetched the latest files from github
echo "Have you already fetched the latest files from GitHub? (git pull)"
read -p "[yes/no]> " inp
case $inp in
	[Yy]* )
		# Copy configurations
		printf '\e[1;4mCopying configurations...\e[0m\n' && cd ~/dotfiles && cp -r .{config,vim*,z*,x*,X*,alias*,p10k.zsh,local} ~ && cp -r {wallpaper*,archlogo.txt,italiarch.png,randomwall.sh} ~ && cp {u,}mount ~ && export dotsCopied=1 || export dotsCopied=0
		;;
	[Nn]* )
		# Run git pull on this repo
		printf '\e[1;4mFetching latest files...\e[0m\n' && cd ~/dotfiles && git pull && cp -r .{config,vim*,z*,x*,X*,alias*,p10k.zsh,local} ~ && cp -r {wallpaper*,archlogo.txt,italiarch.png,randomwall.sh} ~ && cp {u,}mount ~ && export dotsCopied=1 || export dotsCopied=0
		;;
	* )
		echo "Please type either yes or no." ;;
esac

[[ $dotsCopied = 1 ]] &&
printf "
                 _       _           _ 
 _   _ _ __   __| | __ _| |_ ___  __| |
| | | | '_ \ / _  |/ _  | __/ _ \/ _  |
| |_| | |_) | (_| | (_| | ||  __/ (_| |
 \__,_| .__/ \__,_|\__,_|\__\___|\__,_|
      |_|                              
     _       _    __ _ _           _ 
  __| | ___ | |_ / _(_) | ___  ___| |
 / _  |/ _ \| __| |_| | |/ _ \/ __| |
| (_| | (_) | |_|  _| | |  __/\__ \_|
 \__,_|\___/ \__|_| |_|_|\___||___(_)

@ https://github.com/GoDzM4TT3O/dotfiles
\e[1;42mSuccessfully copied updated dotfiles!\e[0m\n"

[[ $dotsCopied = 0 ]] &&
printf "
     _       _    __ _ _           
  __| | ___ | |_ / _(_) | ___  ___ 
 / _  |/ _ \| __| |_| | |/ _ \/ __|
| (_| | (_) | |_|  _| | |  __/\__ \\
 \__,_|\___/ \__|_| |_|_|\___||___/

@ https://github.com/GoDzM4TT3O/dotfiles
\e[1;41mCoudln't copy dotfiles! Either you didn't run 'git pull' or you already have the most up-to-date dotfiles!\e[0m\n"
