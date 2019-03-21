#!/bin/sh

# Friendly Interactive SHell {{{
sudo pacman -Sy fish
echo '/usr/bin/fish' | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish/
ln -s ~/git/dotfiles/fish.config ~/.config/fish/config.fish
# }}}
# Neovim {{{
sudo pacman -Sy neovim
update-alternatives --set /usr/bin/nvim
mkdir -p ~/.config/nvim/
mkdir -p ~/.local/share/nvim/plugged/
mkdir -p ~/.local/share/nvim/undo/
ln -s ~/git/dotfiles/nvim.config ~/.config/nvim/init.vim
vim +PlugInstall +quitall
vim +UpdateRemotePlugins +quitall
#}}}
# tmux {{{
sudo pacman -Sy tmux
mkdir -p ~/.config/tmux/
ln -s ~/git/dotfiles/tmux.config ~/.config/tmux/tmux.config
# }}}

# vim:foldmethod=marker:foldlevel=0
