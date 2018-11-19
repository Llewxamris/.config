# Llewxamris' DotFiles
Collection of my personal config files. Built over time, on the backs of giants,
entirely based on my own needs. 

## bash/
Contains several QoL improvements to Bash, as well as personal alias'. Most of the
improvements comes from Mattia Tezzele's _bash-sensible_: https://github.com/mrzool/bash-sensible/
Includes better tab-completion, better history, and anti-clobbering. PS1 prompt includes the current
directory, and shows the `git` branch if applicable.

## scripts/bin/
Contains various shell scripts that are used within my environment.

- `backlight.sh`: Manipulates the backlight of my laptops monitor
- `git-prompt.sh`: Used for PS1 `git` information. Copyright © Shawn O. Pearce

## suckless/
Contains patches for `dwm`, `slstatus`, and `st`.

- `dwm.patch`: Sets the font and colourscheme of `dmenu` and the status bar.
  Also contains keymapping for laptop media keys
- `slstatus.patch`: Configures the status bar of `dwm`
- `st.patch`: Sets the font and colourscheme

## tmux/
Just sets `tmux` to use true-colour.

## vim/
Vim configuration. Slowly being deprecated for Emacs. Will eventually be replaced by `microvimrc`.

## xorg/
Configuration related to X. Contains `.Xmodmap` to handle swapping the Control Key with Escape,
and my `.xinitrc` that handles applications that are launched whenever the X Server is started,
as well as executing the `dwm` window manager.

My current startup software is:

- Nextcloud :: Self-hosted cloud storage solution
- An Emacs daemon :: Run Emacs as a daemon for better workspace management/loadtimes
- Xmodmap :: Key mapping
- `slstatus` :: Sets status bar for `dwm`
- Compton :: Compositor for X11
- `feh` :: Sets desktop wallpaper
- Dunst :: Daemon for displaying notifications
- Xautolock :: Autolock the screen after a period of time

# Fonts
The current setup uses [Google Noto Fonts][0] and [Font Awesome 5.5][1].

# License
All files are free to use regardless of purpose. See UNLICENSE for more
information.

[0]: https://www.google.com/get/noto/
[1]: http://fontawesome.io/
