#!/bin/sh

# TITLE: Config File Setup Script
# AUTHOR: Maxwell Haley
# DESCRIPTION: Small script that symbolically links configuration files.
# This file is license under UNLICENSE, see UNLICENSE for more details or vist
# http://unlicense.org

dotpath="$HOME/git/dotfiles/"
configpath="$HOME/.config/"

remove_files() {
    rm ~/.bashrc
    rm ~/.vimrc
    rm "$configpath"i3/config
    rm "$configpath"termite/config
    rm "$configpath"compton/compton.conf
    rm "$configpath"dunst/dunstrc
}

common_files() {
    ln -s "$dotpath"bashrc ~/.bashrc
}

workstation_files() {
    ln -s "$dotpath"vimrc ~/.vimrc
    ln -s "$dotpath"i3-config "$configpath"i3/config
    ln -s "$dotpath"termite-config "$configpath"termite/config
    ln -s "$dotpath"compton-config "$configpath"compton/compton.conf
    ln -s "$dotpath"dunstrc "$configpath"dunst/dunstrc
}

server_files() {
    echo "No server files availble.";
}

remove_files; # Always refresh the links.
common_files;

case $1 in
    "workstation")
        workstation_files;
        ;;
    "server")
        server_files;
        ;;
    "remove")
        # Do nothing, remove is always called.
        ;;
esac
