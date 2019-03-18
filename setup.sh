#!/bin/sh

# Friendly Interactive SHell {{{
pacman -Sy fish
echo '/usr/bin/fish' | sudo tee -a /etc/shells
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish/
ln -s ~/git/dotfiles/fish.config ~/.config/fish/config.fish
# }}}
# Neovim {{{
pacman -Sy neovim
update-alternatives --set /usr/bin/nvim
mkdir -p ~/.config/nvim/
mkdir -p ~/.local/share/nvim/plugged/
mkdir -p ~/.local/share/nvim/undo/
ln -s ~/git/dotfiles/nvim.config ~/.config/nvim/init.vim
vim +PlugInstall +quitall
vim +UpdateRemotePlugins +quitall
#}}}
