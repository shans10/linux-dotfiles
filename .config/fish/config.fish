### FISH ESSENTIALS ###

# No greeting when starting an interactive shell.
set -U fish_greeting

# Ctrl-C Binding
function fish_user_key_bindings
  bind \cc 'echo; commandline | cat; commandline ""; commandline -f repaint'
end


### PROMPT ###

# This was the 'sashimi' prompt from oh-my-fish.
function fish_prompt
  set -l last_status $status
  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -g red (set_color -o red)
  set -g blue (set_color -o blue)
  set -l green (set_color -o green)
  set -g normal (set_color normal)

  set -l ahead (_git_ahead)
  set -g whitespace ' '

  if test $last_status = 0
    set initial_indicator "$green◆"
    set status_indicator "$normal❯$cyan❯$green❯"
  else
    set initial_indicator "$red✖ $last_status"
    set status_indicator "$red❯$red❯$red❯"
  end
  set -l cwd $cyan(basename (prompt_pwd))

  if [ (_git_branch_name) ]

    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($red$git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal git:($blue$git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$yellow ✗"
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 5 minutes
  if [ "$CMD_DURATION" -gt 300000 ]
    echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $initial_indicator $whitespace $cwd $git_info $whitespace $ahead $status_indicator $whitespace
end

function _git_ahead
  set -l commits (command git rev-list --left-right '@{upstream}...HEAD' ^/dev/null)
  if [ $status != 0 ]
    return
  end
  set -l behind (count (for arg in $commits; echo $arg; end | grep '^<'))
  set -l ahead  (count (for arg in $commits; echo $arg; end | grep -v '^<'))
  switch "$ahead $behind"
    case ''     # no upstream
    case '0 0'  # equal to upstream
      return
    case '* 0'  # ahead of upstream
      echo "$blue↑$normal_c$ahead$whitespace"
    case '0 *'  # behind upstream
      echo "$red↓$normal_c$behind$whitespace"
    case '*'    # diverged from upstream
      echo "$blue↑$normal$ahead $red↓$normal_c$behind$whitespace"
  end
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end


### FUNCTIONS ###

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

### Emacs Vterm Settings
# Shell-side configuration
function vterm_printf;
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

# vterm-clear-scrollback
if [ "$INSIDE_EMACS" = 'vterm' ]
    function clear
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    end
end


### ALIASES ###

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
alias update='sudo dnf update'
alias install='sudo dnf install'
alias remove='sudo dnf remove'
alias search='sudo dnf search'
alias autoremove='sudo dnf autoremove'
alias clean='sudo dnf clean'


## CLEAR LINUX
# Aliases for software managment
# Swupd
alias update='sudo swupd update'
alias add='sudo swupd bundle-add'
alias remove='sudo swupd bundle-remove'
alias search='sudo swupd search'
alias clean='sudo swupd clean'

## Bootloader
# systemd-boot update
alias boot-up="sudo bootctl update"

# Grub Update
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

## Generate initramfs
alias initramfs-gen='sudo mkinitcpio -p linux'


### SETTING FISH ENVIRONMENT VARIABLES ###

set TERM "xterm-256color"              # Sets the terminal type
set EDITOR "alacritty -e nvim"      # $EDITOR use Emacs in terminal
set VISUAL "emacs"   # $VISUAL use Emacs in GUI mode

# Set Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# CS50
# configure clang
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"

# 256 colors
export TERM="xterm-256color"

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
