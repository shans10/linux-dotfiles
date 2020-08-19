# No greeting when starting an interactive shell.
set -U fish_greeting

# Ctrl-C Binding
function fish_user_key_bindings
  bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
end

#ALIASES

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias Pupdate='sudo pacman -Syu'
alias Pinstall='sudo pacman -S'

# yay as aur helper - updates everything
alias update="yay -Syu"
alias install="yay -S"
alias remove='yay -Rns'

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Mirror Update to latest top 200 mirrors
alias mirror-update='sudo reflector --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist'


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


# Remove file and directory with sudo
alias srem='sudo rm'
alias sremd='sudo rm -r'

# Copy file and directory with sudo
alias copy='cp'
alias copyd='cp -r'
alias scopy='sudo cp'
alias scopyd='sudo cp -r'

# Mount phone's partition using FTP
alias fconnect='curlftpfs ftp://192.168.43.1:9999 /mnt/ftpfs/'
# Unmount partition
alias fdiscon='sudo umount /mnt/ftpfs'


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
