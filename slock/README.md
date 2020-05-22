slock - simple screen locker
============================
simple screen locker utility for X. 


Requirements
------------
In order to build slock you need the Xlib header files.

You also need fortune.

Installation instructions:

- Debian/Mint/Ubuntu: `sudo apt install fortune -y`
- Arch Linux/Manjaro: `sudo pacman -S fortune-mod`


Installation
------------
Slock was already configured by me. To install it, run `sudo make install` in the same directory as Slock. Note that the 
lines below aren't needed, unless you apply another patch/make changes to Slock. 
Please see https://github.com/GoDzM4TT3O/dotfiles/blob/master/slock/patches/README for more info about patches.

Edit config.mk to match your local setup (slock is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install slock
(if necessary as root):

    make clean install


Running slock
-------------
Simply invoke the 'slock' command. To get out of it, enter your password.
