#!/bin/sh
DOTFILES=$HOME/git/dotfiles

case $1 in
	'dark')
        rm $HOME/.Xresources
        rm $HOME/.vimrc
        rm $HOME/.config/compton.conf
        rm $HOME/.config/polybar/config
		ln -s $DOTFILES/.Xresources.dark $HOME/.Xresources
		ln -s $DOTFILES/.vimrc.dark $HOME/.vimrc
        ln -s $DOTFILES/.config/compton.conf.dark $HOME/.config/compton.conf
        ln -s $DOTFILES/.config/polybar/config.dark $HOME/.config/polybar/config
        killall compton
        killall polybar
        compton &
        polybar -r bar1 &
	;;
	'light')
        rm $HOME/.Xresources
        rm $HOME/.vimrc
        rm $HOME/.config/compton.conf
        rm $HOME/.config/polybar/config
		ln -s $DOTFILES/.Xresources.light $HOME/.Xresources
		ln -s $DOTFILES/.vimrc.light $HOME/.vimrc
        ln -s $DOTFILES/.config/compton.conf.light $HOME/.config/compton.conf
        ln -s $DOTFILES/.config/polybar/config.light $HOME/.config/polybar/config
        killall compton
        killall polybar
        compton &
        polybar -r bar1 &
	;;
	*)
		echo "Theme not found."
	;;
esac

xrdb -load $HOME/.Xresources
