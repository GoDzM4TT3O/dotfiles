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
Please see https://github.com/GoDzM4TT3O/dotfiles/blob/master/slock/patches/README.md for more info about patches.

Edit config.mk to match your local setup (slock is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install slock
(if necessary as root):

    make clean install

Features
--------

When typing a password, the screen turns blue. If you pressed the SHIFT key before entering your password, it will become red (not a bright red): you don't have to worry about that, it's just telling you you pressed the SHIFT key.

When entering a password, if the CAPS LOCK key is pressed, the screen will turn bright red, to tell you that the password is being entered LIKE THIS.

You can also press the ESC key to delete all of the text you typed, so that you don't need to keep holding BACKSPACE.

With the Message patch, you can see when the screen was locked, and a random quote.

Patches
-------

(Deprecated patches not shown)

- Capscolor: Introduces an additional color to indicate the state of Caps Lock. (see the second paragraph in [Features](#features))

- Control clear: Adds an additional configuration parameter, controlkeyclear. When set to 1, slock will no longer change to the failure color if a control key is pressed while the buffer is empty. This is useful if, for example, you wake your monitor up by pressing a control key and don't want to spoil the detection of failed unlocking attempts.

- DPMS: This patch interacts with the Display Power Management Signaling and automatically turns off the monitor after a configurable time. The monitor is reactivated by a keystroke or moving the mouse.

- Message: This patch lets you add a message to your lock screen. You can place a default message in `config.h`, and you can also pass a message with `-m message` (see the fourth paragraph in [Features](#features))

- Pam auth: Replaces shadow support with PAM authentication support. Change variable pam_service in config.def.h to the corresponding PAM service. (the default configuration is for ArchLinux's login service)

- Quickcancel: Cancel slock by moving the mouse within a certain time-period after slock started. The time-period can be defined in seconds with the setting timetocancel in the config.h. This is useful if you forgot to disable xautolock during an activity that requires no input. (e.g. reading text, watching video) (this is not needed as xAutoLock provides the "detectsleep" flag to detect inactivity)

- UnlockScreen: This patch keeps the screen unlocked but keeps the input locked. That is, the screen is not affected by slock, but users will not be able to interact with the X session unless they enter the correct password. (I don't recommend using this because it's not clear whether the screen is locked or not, unless you're 100% sure you locked it)

- Xresources: This patch adds the ability to get colors via Xresources. This patch is already applied on Capscolor patch.

Running slock
-------------
Simply invoke the 'slock' command. To get out of it, enter your password.
