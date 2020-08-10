# My st (simple terminal) build

![Screenshot of simple terminal](https://gitlab.com/dwt1/dotfiles/raw/master/.screenshots/dotfiles11.png) 
st is a simple terminal emulator for X which sucks less.  This is my personal build of st.  I used a number of patches in this build to make st more "sensible" rather than "suckless."  The patches I added to this build include:
+ alpha (for transparency)
+ font2 (to allow setting more than one font, useful when the default font has missing glyphs)
+ scrollback (scrollback through terminal using Shift+PageUp/PageDown.)
+ scrollback mouse altscreen (allows scrolling using Shift+MouseWheel.)

# Installing st-distrotube on Arch Linux

All you need to do is download the PKGBUILD from this repository.  Then run the following command:

	makepkg -cf
	
This will create a file that ends in .pkg.tar.xz (for example, st-distrotube-git-6.2-1-x86_64.pkg.tar.xz).  Then run:

	sudo pacman -U *.pkg.tar.xz 
	
Alternately, you could also install dwm-distrotube from the AUR using an AUR helper such as yay:

	yay -S st-distrotube-git
	
NOTE: Installing st-distrotube-git conflicts with the standard st package.  If you already have st installed, you will be asked if you want to remove st and install st-distrotube-git instead. 
	
	
# Installing st-distrotube on other Linux distributions

Download the source code from this repository or use a git clone:

	git clone https://gitlab.com/dwt1/st-distrotube.git
	cd st-distrotube
    sudo make clean install
	
NOTE: Installing st-distrotube will overwrite your existing st installation.