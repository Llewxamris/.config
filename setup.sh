#!/bin/sh

# TITLE: Config File Setup Script
# AUTHOR: Maxwell Haley
# DESCRIPTION: Small script that symbolically links configuration files.
# This file is license under UNLICENSE, see UNLICENSE for more details or vist
# http://unlicense.org

dotpath="$HOME/git/dotfiles/"

remove_files() {
    rm ~/.bashrc
    rm ~/.vimrc
}

common_files() {
    ln -s "$dotpath"bashrc ~/.bashrc
}

workstation_files() {
    ln -s "$dotpath"vimrc ~/.vimrc
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
