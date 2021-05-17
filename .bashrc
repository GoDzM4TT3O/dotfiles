# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

#> EXPORTS

# Preferred editor: If neovim is found, use it; otherwise use vim
[ $(which nvim) ] && export EDITOR='nvim' || export EDITOR='vim'

# Correctly set language variables
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="it_IT.UTF-8"
export LC_TIME="it_IT.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="it_IT.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="it_IT.UTF-8"
export LC_NAME="it_IT.UTF-8"
export LC_ADDRESS="it_IT.UTF-8"
export LC_TELEPHONE="it_IT.UTF-8"
export LC_MEASUREMENT="it_IT.UTF-8"
export LC_IDENTIFICATION="it_IT.UTF-8"

# Set LD_PRELOAD to avoid warning messages
export LD_PRELOAD=""

# Add /home/$USER/.local/bin to PATH so any script in that directory is executable
export PATH=$HOME/.local/bin:$HOME/.config/scripts:$PATH:/usr/local/bin

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Key timeout for Vim mode
export KEYTIMEOUT=1

# Set default Browser
export BROWSER="librewolf"

#> FUNCTIONS

# Send mail from terminal
# Usage: compose SUBJECT DEST
compose() {
	neomutt -s $1 $2
}

# Empty trash (.local/share/Trash)
empty-trash() {
	printf "Do you really want to empty the Trash? [y/n] "
	read emptytrash
	case $emptytrash in
		y|Y)
			printf "Emptying trash...\n"
			rm -fr "~/.local/share/Trash/*"
			;;
		n|N)
			printf "Aborting...\n"
			;;
		*)
			printf "Unknown character, aborting!\n"
			;;
	esac
}

# Create a directory and cd into it
mkcd() {
	mkdir "$1" && cd "$1" || echo "Failed to create directory $1! "
}

# Encode a string in a qr code
qrencode() {
	curl "qrenco.de/$1"
}

# Uninstall APKs on android phone using ADB
rm-apk() {
	adb uninstall --user 0 "$1"
}

# Convert any supported file to mp4
tomp4() {
	file=$(echo "$1" | sed "s/\.mkv$/\.mp4/g")
	ffmpeg -i "$1" -codec copy "$file"
}

#< END FUNCTIONS

#> SOURCES
# Bash completions
source /etc/bash/bashrc.d/bash_completion.sh

# Source aliases
source ~/.aliases

# ls colors
source ~/.ls-cols

#< END SOURCES

#> OTHERS
# Check if running in a TTY, and appropriately modify vim's color settings
if [[ "$TERM" =~ "linux" ]]; then
	sed -in 's/colorscheme dogrun/colorscheme zellner/;s/set termguicolors/set notermguicolors/' ~/.vimrc
	setfont ter-u16b.psf.gz
else if [[ "$TERM" =~ "screen-256color" ]]; then
	sed -in 's/colorscheme zellner/colorscheme dogrun/;s/set termguicolors/set notermguicolors/' ~/.vimrc
else
	sed -in 's/colorscheme zellner/colorscheme dogrun/;s/set notermguicolors/set termguicolors/' ~/.vimrc
fi
fi

#< END OTHERS

echo "Successfully started bash"
