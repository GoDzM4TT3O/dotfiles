# Check if we are running Plan9's "dumb" terminal, and open the Plan9 shell
if [[ $TERM = "dumb" ]]; then
	echo "Opening the Plan9 shell (rc) from zsh..."
	/usr/lib/plan9/bin/rc && echo "Quitting! "
	exit
fi

#> PROMPT

# Enable colors and change prompt
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}"

# Add git info in the prompt
autoload -Uz add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info
PS1+='%F{red}${vcs_info_msg_0_}%f $%b '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' check-for-staged-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' unstagedstr ' ?'
zstyle ':vcs_info:*' stagedstr ' +'
# %a -> action info
# %b -> branch name
# %c -> show staged changes
# %m -> show stash info
# %r -> repository root directory
# %s -> current vcs
# %S -> current path, relative to root directory
# %u -> show unstaged changes
zstyle ':vcs_info:git:*' formats '(%b%u%c%m)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a|%u%c%m)'

# Basic tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in tab completion
_comp_options+=(globdots)

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes
function zle-keymap-select() {
	case $KEYMAP in
		# Block
		vicmd) echo -ne '\e[1 q';;
		# Beam
		viins|main) echo -ne '\e[5 q';;
	esac
}
zle -N zle-keymap-select
zle-line-init() {
	# Initiate "vi insert" as keymap
	zle -K viins
	echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shaped cursor on startup
echo -ne '\e[5 q'

# Use beam shaped cursor for each new prompt
preexec() {
	echo -ne '\e[5 q'
}

# Edit line in vim with CTRL+E
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim mode
bindkey -v

#< END PROMPT

#> SETOPTs

# Automatically cd into typed directory
setopt autocd

# Disable CTRL+S to freeze terminal
stty stop undef
setopt interactive_comments

# Extended pattern matching features
setopt extendedglob

# Enable prompt substitution
setopt prompt_subst

#< END SETOPTs

#> ZSH VARIABLES

# If pasting URLs and other text is messed up, set to "true"
DISABLE_MAGIC_FUNCTIONS=true

# To disable colors in ls, set to "true"
DISABLE_LS_COLORS=false

# To disable auto-setting terminal title, set to "true"
DISABLE_AUTO_TITLE=true

# To enable command auto-correction, set to "true"
ENABLE_CORRECTION=false

# To display red dots whilst waiting for completion, set to "true"
COMPLETION_WAITING_DOTS=true

# To disable marking untracked files under VCS as dirty, set to "true"
DISABLE_UNTRACKED_FILES_DIRTY=false

# Uncomment the following line if you want to change the
# command execution time stamp shown in the history command output.
HIST_STAMPS="dd/mm/yyyy"

# Zsh history scrollback lines
HISTSIZE=10000

# Zsh max history lines
SAVEHIST=10000

# Save history to ~/.zsh_history
HISTFILE=~/.zsh_history
setopt appendhistory

#< END ZSH VARIABLES

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
export PATH=$HOME/.local/bin:$HOME/.config/scripts:$PATH

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Key timeout for Vim mode
export KEYTIMEOUT=1

# Compilation flags
export ARCHFLAGS="-arch x86_64"
#-- Architecture
export CARCH="x86_64"
export CHOST="x86_64-pc-linux-gnu"
#-- Compiler Flags
export CFLAGS=" -march=haswell -mtune=haswell -O3 -pipe -fno-plt "
export CXXFLAGS=" -march=haswell -mtune=haswell -O3 -pipe -fno-plt "
#-- Make Flags
export MAKEFLAGS="-j4"

# Support for pam-gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass3

#< END EXPORTS

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
# Source aliases
source ~/.aliases

# Load zsh plugins
source /usr/share/doc/pkgfile/command-not-found.zsh
source "$HOME/.local/share/zsh/archlinux/archlinux.plugin.zsh"
source "$HOME/.local/share/zsh/colored-man-pages/colored-man-pages.plugin.zsh"
source "$HOME/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$HOME/.local/share/zsh/gitfast/gitfast.plugin.zsh"
source "$HOME/.local/share/zsh/safe-paste/safe-paste.plugin.zsh"
source "$HOME/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Use fzf for reverse history searching
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#< END SOURCES

#> OTHERS
# Check if running in a TTY, and appropriately modify vim's color settings
if [[ "$TERM" =~ "linux" ]]; then
	sed -in 's/colorscheme dogrun/colorscheme zellner/;s/set termguicolors/set notermguicolors/' ~/.vimrc
else if [[ "$TERM" =~ "screen-256color" ]]; then
	sed -in 's/colorscheme zellner/colorscheme dogrun/;s/set termguicolors/set notermguicolors/' ~/.vimrc
else
	sed -in 's/colorscheme zellner/colorscheme dogrun/;s/set notermguicolors/set termguicolors/' ~/.vimrc
fi
fi

# Support for pam-gnupg
[[ $TERM =~ "linux" ]] && eval $(ssh-agent -s) > /dev/null && ssh-add

#< END OTHERS

echo "Successfully started zsh"
