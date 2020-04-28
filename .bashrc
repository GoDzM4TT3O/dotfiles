# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;37;44m\]\u@\h\[\033[00m\] \[\033[01;37m\]\w\[\033[01m\] »\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias all='ls -all'
alias LS='sl'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## begin custom

# At terminal startup, display some info about our system
# neofetch --color_blocks off

# change if you use a different terminal
#export TERMINAL="kitty"

# https://gitlab.com/dwt1/shell-color-scripts
# random colors
colorscript -r

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# powerline - START
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. ~/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
# powerline - END

## START custom functions
# cheatsheet
cheat()
{
	curl cheat.sh/$1
}

# dictionary
dict() {
	curl dict.org/d:$1
}

# cryptocurrency rates
rate() {
	curl rate.sx/$1
}

# share files/text
share() {
	echo "$1" | nc termbin.com 9999
}

# shorten url
shorturl() {
	curl -s http://tinyurl.com/api-create.php?url=$1; printf "\n"
}

# console browser, works even in TTY
browser() {
	ssh brow.sh
}

# random joke
joke() {
	curl https://icanhazdadjoke.com; printf "\n"
}

# encode a string in a qr code
qrencode() {
	curl qrenco.de/$1
}

# convert any supported file to mp4
tomp4() {
	ffmpeg -i "$1" -codec copy "$1".mp4
}

# uninstall APKs on android phone using ADB
rm-apk() {
	adb uninstall --user 0 "$1"	
}


# usage: github username/repo
# equals: git clone https://github.com/username/repo
github() {
	git clone https://github.com/$1
}

# show the current weather in a city
# usage: weather CityName
weather() {
	curl wttr.in/$1
}
## END custom functions

# https://github.com/curusarn/resh
[[ -f ~/.resh/shellrc ]] && source ~/.resh/shellrc

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion pip

# Bash command-not-found
# READ: https://github.com/godzm4tt3o/Arch#25-command-not-found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto cd
# READ: https://github.com/godzm4tt3o/Arch#26-automatically-enter-a-directory
shopt -s autocd

# show a big text containing the user's name (from $USER)
# install figlet:
# Debian/Mint/Ubuntu: sudo apt install figlet
# Arch Linux/Manjaro: sudo pacman -S figlet
figlet $USER
