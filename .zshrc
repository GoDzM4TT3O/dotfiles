# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# Add /home/$USER/.local/bin to PATH so any script in that directory is executable
export PATH=$HOME/.local/bin:$HOME/.config/scripts:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$(whoami)/.oh-my-zsh"

# extended pattern matching features
setopt extendedglob

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Zsh history scrollback lines
HISTSIZE=1000

# Zsh max history lines
SAVEHIST=1000

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(adb archlinux colored-man-pages fast-syntax-highlighting gitfast safe-paste zsh-autosuggestions zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

autoload -Uz promptinit
promptinit

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

# Use vim mode in the terminal
# set -o vi

# Command not found (Arch Linux; uses `pkgfile`)
source /usr/share/doc/pkgfile/command-not-found.zsh

# Preferred editor: If neovim is found, use it; otherwise use vim
[ $(which nvim) ] && export EDITOR='nvim' || export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Compilation flags
#-- Architecture
export CARCH="x86_64"
export CHOST="x86_64-pc-linux-gnu"
#-- Compiler Flags (set to Haswell CPU for max performance)
export CFLAGS=" -march=haswell -mtune=haswell -O3 -pipe -fno-plt "
export CXXFLAGS=" -march=haswell -mtune=haswell -O3 -pipe -fno-plt "
#-- Make Flags: change this for DistCC/SMP systems
export MAKEFLAGS="-j2"

# Set LD_PRELOAD to avoid warning messages
export LD_PRELOAD=""

# check if running in a TTY, and appropriately modify vim's color settings
if [[ "$TERM" =~ "linux" ]]; then
	sed -in 's/colorscheme dogrun/colorscheme monokai/;s/set termguicolors/set notermguicolors/' ~/.vimrc

# we are running in a graphical terminal, so revert back to default settings
else
	sed -in 's/colorscheme monokai/colorscheme dogrun/;s/set notermguicolors/set termguicolors/' ~/.vimrc
fi

# encode a string in a qr code
qrencode() {
	curl "qrenco.de/$1"
}

# convert any supported file to mp4
tomp4() {
	file=$(echo "$1" | sed "s/\.mkv$/\.mp4/g")
	ffmpeg -i "$1" -codec copy "$file"
}

# uninstall APKs on android phone using ADB
rm-apk() {
	adb uninstall --user 0 "$1"	
}

# create a directory and cd into it
mkcd() {
	mkdir "$1" && cd "$1"
}

# empty trash
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

# pip bash completion
_pip_completion() {
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion pip

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf for reverse history searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add aliases
source ~/.aliases

echo "Successfully started zsh"
