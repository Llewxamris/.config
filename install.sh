#!/bin/sh

ALACRITTY_SRC="dist/alacritty.yml"
ALACRITTY_DEST="${HOME}/.config/alacritty/alacritty.yml"

TMUX_SRC="dist/config.tmux"
TMUX_DEST="${HOME}/.config/tmux/tmux.conf"

BASH_SRC="dist/bashrc.bash"
BASH_DEST="${HOME}/.bashrc"

BASH_PROFILE_SRC="dist/bash-profile.bash"
BASH_PROFILE_DEST="${HOME}/.bash_profile"

PROFILE_SRC="dist/profile.sh"
PROFILE_DEST="${HOME}/.profile"

READLINE_SRC="dist/inputrc.readline"
READLINE_DEST="${HOME}/.inputrc"

VIM_SRC="dist/config.vim"
VIM_DEST="${HOME}/.config/vim/config.vim"

LSCOLORS_SRC="dist/dircolours.txt"
LSCOLORS_DEST="${HOME}/.local/share/lscolors.sh"

create_link() {
    ln --symbolic --force  \
       "$(readlink --canonicalize "$2")" "$1"
}

main() {
    for file in dist/*; do
        case "${file}" in
            "${ALACRITTY_SRC}")
                create_link "${ALACRITTY_DEST}" "${file}"
                ;;
            "${BASH_SRC}")
                create_link "${BASH_DEST}" "${file}"
                ;;
            "${BASH_PROFILE_SRC}")
                create_link "${BASH_PROFILE_DEST}" "${file}"
                ;;
            "${PROFILE_SRC}")
                create_link "${PROFILE_DEST}" "${file}"
                ;;
            "${READLINE_SRC}")
                create_link "${READLINE_DEST}" "${file}"
                ;;
            "${TMUX_SRC}")
                create_link "${TMUX_DEST}" "${file}"
                ;;
            "${VIM_SRC}")
                create_link "${VIM_DEST}" "${file}"
                ;;
            "${LSCOLORS_SRC}")
                dircolors -b "${LSCOLORS_SRC}" > "${LSCOLORS_DEST}"
                ;;
        esac
    done
}

main "$@"
