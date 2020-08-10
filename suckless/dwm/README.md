# My dwm (dynamic window manager) build

![Screenshot of my desktop](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dotfiles04.png) 
Dwm is an extremely fast, small, and dynamic window manager for X.  This is my personal build of dwm.  I used a number of patches in this build to make dwm more "sensible" rather than "suckless."  The patches I added to this build include:
+ alpha (for transparency)
+ attachaside (new clients appear in the stack rather than as the master)
+ cyclelayouts (cycles through the available layouts)
+ gridmode (adding a grid layout)
+ restartsig (allows dwm to be restarted with a keybinding)
+ rotatestack (moves a window through the stack, in either direction)
+ statuspadding (horizontal and vertical padding in the status bar are now configurable options)
+ uselessgap (adding gaps when more than one window)

# Dependencies
+ libxft
+ ttf-hack
+ ttf-joypixels
+ st
+ dmenu
+ tabbed

Also, you will need to add the following from the AUR:
+ nerd-fonts-complete (optional)
+ https://aur.archlinux.org/packages/libxft-bgra/ (needed for colored fonts and emojis)

Also, if you are building this on an Ubuntu-based system, you need to install libx11-dev and xorg-dev.

# Installing dwm-distrotube on Arch Linux

All you need to do is download the PKGBUILD from this repository.  Then run the following command:

	makepkg -cf
	
This will create a file that ends in .pkg.tar.xz (for example, dwm-distrotube-git-6.2-1-x86_64.pkg.tar.xz).  Then run:

	sudo pacman -U *.pkg.tar.xz 
	
Alternately, you could also install dwm-distrotube-git from the AUR using an AUR helper such as yay:

	yay -S dwm-distrotube-git
	
NOTE: Installing dwm-distrotube-git conflicts with the standard dwm package.  If you already have dwm installed, you will be asked if you want to remove dwm and install dwm-distrotube-git instead. 
	
	
# Installing dwm-distrotube on other Linux distributions

Download the source code from this repository or use a git clone:

	git clone https://gitlab.com/dwt1/dwm-distrotube.git
	cd dwm-distrotube
    sudo make clean install
	
NOTE: Installing dwm-distrotube will overwrite your existing dwm installation.
	
# My Keybindings

The MODKEY is set to the Super key (aka the Windows key).  I try to keep the
keybindings consistent with all of my window managers.

| Keybinding | Action |
| :--- | :--- |
| `MODKEY + RETURN` | opens terminal (alacritty is the terminal but can be easily changed) |
| `MODKEY + SHIFT + RETURN` | opens run launcher (dmenu is the run launcher but can be easily changed) |
| `MODKEY + SHIFT + c` | closes window with focus |
| `MODKEY + SHIFT + r` | restarts dwm |
| `MODKEY + SHIFT + q` | quits dwm |
| `MODKEY + 1-9` | switch focus to workspace (1-9) |
| `MODKEY + SHIFT + 1-9` | send focused window to workspace (1-9) |
| `MODKEY + j` | focus stack +1 (switches focus between windows in the stack) |
| `MODKEY + k` | focus stack -1 (switches focus between windows in the stack) |
| `MODKEY + SHIFT + j` | rotate stack +1 (rotates the windows in the stack) |
| `MODKEY + SHIFT + k` | rotate stack -1 (rotates the windows in the stack) |
| `MODKEY + h` | setmfact -0.05 (expands size of window) |
| `MODKEY + l` | setmfact +0.05 (shrinks size of window) |
| `MODKEY + .` | focusmon +1 (switches focus next monitors) |
| `MODKEY + ,` | focusmon -1 (switches focus to prev monitors) |


# Running dwm

If you do not use a login manager (like lightdm) then you can add the following line to your .xinitrc to start dwm using startx:

    exec dwm
	
If you use a login manager (like lightdm), make sure that you have a file called dwm.desktop in your /usr/share/xsessions/ directory.  It should look something like this:

	[Desktop Entry]
	Encoding=UTF-8
	Name=Dwm
	Comment=Dynamic window manager
	Exec=dwm
	Icon=dwm
	Type=XSession


# Configuring dwm-distrotube

If you installed dwm-distrotube-git using the AUR, then the source code can be found in /opt/dwm-distrotube-git.  If you downloaded the source and built dwm-distrotube yourself, then the source in the directory that you downloaded.  The configuration of dwm-distrotube is done by editng the config.h and (re)compiling the source code.  

	sudo make install
	
# Adding an autostart file

dwm-distrotube has been patched in such a way that it looks for an autostart file at: $HOME/.dwm/autostart.sh

You will need to create this file and the directory that it is located.  An example autostart.sh is included below:

	#! /bin/bash 
	compton &
	nitrogen --restore &
	dwmblocks &
	
The example autostart.sh above launches the compton compositor, sets the wallpaper with nitrogen and launches dwmblocks to add some widgets to our dwm panel.  Obviously, you would need to install compton and nitrogen to use those programs in your autostart.  And you would need to install [dwmblocks](https://gitlab.com/dwt1/dotfiles/-/tree/master/dwmblocks) to use it.  To use my dwmblocks, you also need to download the scripts found [here](https://gitlab.com/dwt1/dotfiles/-/tree/master/.local%2Fbin).
