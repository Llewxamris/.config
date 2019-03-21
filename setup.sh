#!/bin/sh

# Friendly Interactive SHell {{{

sudo pacman -Sy fish python pkgfile
echo '/usr/bin/fish' | sudo tee -a /etc/shells
mkdir -p ~/.config/fish/
ln -s ~/git/dotfiles/fish.config ~/.config/fish/config.fish

# Set fish as the default shell
chsh -s /usr/bin/fish

# }}}
# Neovim {{{

sudo pacman -Sy neovim python-neovim xsel
update-alternatives --set /usr/bin/nvim
mkdir -p ~/.config/nvim/
mkdir -p ~/.local/share/nvim/plugged/
mkdir -p ~/.local/share/nvim/undo/
ln -s ~/git/dotfiles/nvim.config ~/.config/nvim/init.vim

# vim-plug setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +quitall
nvim +UpdateRemotePlugins +quitall

#}}}
# tmux {{{

sudo pacman -Sy tmux
mkdir -p ~/.config/tmux/
ln -s ~/git/dotfiles/tmux.config ~/.config/tmux/tmux.config

# }}}

# vim:foldmethod=marker:foldlevel=0
