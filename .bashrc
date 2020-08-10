#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

#PS1='\[\e[1m\]\W ➤➤➤ \[\e[0m\]'
PS1="\[$(tput bold)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;198m\]❱\[$(tput sgr0)\]\[\033[38;5;129m\]❱\[$(tput sgr0)\]\[\033[38;5;51m\]❱\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

if [ -d "$HOME/.bin" ] ;
	then PATH="$HOME/.bin:$PATH"
fi




# Personal Aliases
[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal



# FZF Type
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'




# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# CS50
# configure clang
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"

# 256 colors
export TERM="st-256color"

# QT Platform
export QT_QPA_PLATFORMTHEME=qt5ct

# Prompt with git support
# Install it using "curl https://raw.githubusercontent.com/riobard/bash-powerline/master/bash-powerline.sh > ~/.bash-powerline.sh"
source ~/.bash-powerline.sh
