# No greeting when starting an interactive shell.
set -U fish_greeting

# Ctrl-C Binding
function fish_user_key_bindings
  bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
end


# Bash Style Command Substitution and Chaining
# Bang Bang(Previous Command)
function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end
#(Last Argument of previous command)
function bind_dollar
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# Setting the bindings
function fish_user_key_bindings
  bind ! bind_bang
  bind '$' bind_dollar
end


#ALIASES

# Aliases for software managment
# Swupd
alias update='sudo swupd update'
alias add='sudo swupd bundle-add'
alias remove='sudo swupd bundle-remove'
alias search='sudo swupd search'
alias clean='sudo swupd clean'


# Containers
# docker
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker'

# lxd
alias lstart='sudo systemctl start lxd'
alias lstop='sudo systemctl stop lxd'


# Bootloader
# systemd-boot update
alias boot-up="sudo bootctl update"


# Generate initramfs
alias initramfs-gen='sudo mkinitcpio -p linux'


# Mount phone's partition using FTP
alias fconnect='curlftpfs ftp://192.168.43.1:9999 /mnt/ftpfs/'
# Unmount partition
alias fdiscon='sudo umount /mnt/ftpfs'


# Set Locale
#export LANG="en_US.UTF-8"
#export LC_ALL="en_US.UTF-8"


# CS50
# configure clang
# export CC="clang"
# export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
# export LDLIBS="-lcrypt -lcs50 -lm"


# Rust
source $HOME/.cargo/env


# 256 colors
export TERM="xterm-256color"


# Firefox Precision Scrolling
export MOZ_USE_XINPUT2=1
