#!/usr/bin/bash -eu

# curl -o ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
# ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua

# https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package
mkdir -p ~/.config/nvim/
ln -s ~/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
