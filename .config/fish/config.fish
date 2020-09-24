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


### ALIASES

## ARCH LINUX
# Aliases for software managment
# pacman
alias pupdate='sudo pacman -Syu'
alias pinstall='sudo pacman -S'
alias premove='sudo pacman -Rns'

# yay as aur helper - updates everything
alias update="yay -Syu"
alias install="yay -S"
alias remove='yay -Rns'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Mirror Update to latest top 200 mirrors
alias mirror-update='sudo reflector --country India --latest 5 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist'


## FEDORA
# Aliases for software managment
# dnf
alias du='sudo dnf update'
alias di='sudo dnf install'
alias dr='sudo dnf remove'
alias ds='sudo dnf search'
alias da='sudo dnf autoremove'
alias dc='sudo dnf clean'

# yum
alias yu='sudo yum update'
alias yi='sudo yum install'
alias yr='sudo yum remove'
alias ys='sudo yum search'
alias ya='sudo yum autoremove'
alias yc='sudo yum clean'


## CLEAR LINUX
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

# Grub Update
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Generate initramfs
alias initramfs-gen='sudo mkinitcpio -p linux'



### EXPORTS
# Set Locale
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


# Firefox Precision Scrolling
export MOZ_USE_XINPUT2=1


# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end


# Setting Display Variable for WSL
# if uname -r | grep 'microsoft' > /dev/null
#   set -l LOCAL_IP (cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
#   set -xg DISPLAY $LOCAL_IP:0
# end
