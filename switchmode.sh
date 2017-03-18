#!/bin/sh
DOTFILES=$HOME/git/dotfiles

case $1 in
	'dark')
        rm $HOME/.Xresources
        rm $HOME/.vimrc
		ln -s $DOTFILES/.Xresources.dark $HOME/.Xresources
		ln -s $DOTFILES/.vimrc.dark $HOME/.vimrc
	;;
	'light')
        rm $HOME/.Xresources
        rm $HOME/.vimrc
		ln -s $DOTFILES/.Xresources.light $HOME/.Xresources
		ln -s $DOTFILES/.vimrc.light $HOME/.vimrc
	;;
	*)
		echo "Theme not found."
	;;
esac

xrdb -load $HOME/.Xresources
