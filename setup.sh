#!/bin/sh

# TITLE: Config File Setup Script
# AUTHOR: Maxwell Haley
# DESCRIPTION: Small script that symbolically links configuration files.
# This file is license under UNLICENSE, see UNLICENSE for more details or vist
# http://unlicense.org

if [ "$1" = "-D" ]; then
    for D in *; do [ -d "${D}" ] && stow -D "${D}" -t "$HOME"; done
else
    for D in *; do [ -d "${D}" ] && stow "${D}" -t "$HOME"; done
fi

