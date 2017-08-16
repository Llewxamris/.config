#!/bin/sh

# TITLE: Config File Setup Script
# AUTHOR: Maxwell Haley
# DESCRIPTION: Small script that symbolically links configuration files.
# This file is license under UNLICENSE, see UNLICENSE for more details or vist
# http://unlicense.org

dotpath="$HOME/git/dotfiles"
configpath="$HOME/.config"
vimpath="$HOME/.vim"
i3path="$configpath/i3"
termitepath="$configpath/termite"
comptonpath="$configpath/compton"
dunstpath="$configpath/dunst"
polybarpath="$configpath/polybar"

vimfile="$vimpath/vimrc"
i3file="$i3path/config"
termitefile="$termitepath/config"
comptonfile="$comptonpath/compton.conf"
dunstfile="$dunstpath/dunstrc"
polybarfile="$polybarpath/config"

remove_files() {
    # Removes config files if the file already exists.
    if [ -f "$HOME/.bashrc" ]; then
        rm ~/.bashrc
    fi
    if [ -f "$HOME/.vimrc" ]; then
        rm ~/.vimrc #Legacy Remove
    fi
    if [ -f "$vimfile" ]; then
        rm "$vimfile"
    fi
    if [ -f "$i3file" ]; then
        rm "$i3file"
    fi
    if [ -f "$termitefile" ]; then
        rm "$termitefile"
    fi
    if [ -f "$comptonfile" ]; then
        rm "$comptonfile"
    fi
    if [ -f "$dunstfile" ]; then
        rm "$dunstfile"
    fi
    if [ -f "$polybarfile" ]; then
        rm "$polybarfile"
    fi
}

common_files() {
    # Creates symlinks for configs destined for any machine.

    ln -s "$dotpath"/bashrc ~/.bashrc
}

workstation_files() {
    # Creates symlinks for all configs destined for a workstation.
    # Checks if config directory exists, creates it if it doesn't, then creates
    # the symlink.

    if [ ! -d "$vimpath" ]; then
        mkdir "$vimpath"
    fi
    ln -s "$dotpath"/vimrc "$vimfile"
    if [ ! -d "$i3path" ]; then
        mkdir "$i3path"
    fi
    ln -s "$dotpath"/i3-config "$i3file"
    if [ ! -d "$termitepath" ]; then
        mkdir "$termitepath"
    fi
    ln -s "$dotpath"/termite-config "$termitefile"
    if [ ! -d "$comptonpath" ]; then
        mkdir "$comptonpath"
    fi
    ln -s "$dotpath"/compton-config "$comptonfile"
    if [ ! -d "$dunstpath" ]; then
        mkdir "$dunstpath"
    fi
    ln -s "$dotpath"/dunstrc "$dunstfile"
    if [ ! -d "$polybarpath" ]; then
        mkdir "$polybarpath"
    fi
    ln -s "$dotpath"/polybar-config "$polybarfile"
}

server_files() {
    # Creates symlinks for all configs destined for a server.
    if [ ! -d "$vimpath" ]; then
        mkdir "$vimpath"
    fi
    ln -s "$dotpath"/microvimrc "$vimfile"
}

remove_files; # Always refresh the links.

case $1 in
    "workstation")
        common_files;
        workstation_files;
        ;;
    "server")
        common_files;
        server_files;
        ;;
    "remove")
        # Do nothing, remove is always called.
        ;;
esac
