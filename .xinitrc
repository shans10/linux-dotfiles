#!/bin/bash

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Set Wallpaper
nitrogen --restore &

# Notification Daemon
# dunst &

# Start window compositor
# picom -b --config /home/shan/.config/picom/picom.conf

# Automount Removable Media
udiskie &

# Gnome Polkit Agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Lock on lid close
# xss-lock slimlock --ignore-sleep &

# Automatically Hide Cursor
unclutter &

# mconnect daemon
# mconnect -d &

# For jettbrains ide
export _JAVA_AWT_WM_NONREPARENTING=1

# Start Window Manager
exec xmonad
