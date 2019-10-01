#!/bin/sh

echo "Setting up Eugene's environment...\c"

# Install Zsh if it doesn't yet exist.
if test ! $(which zsh); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Link Vim config.
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc

# Link Vim color scheme.
rm -rf $HOME/.vim
mkdir $HOME/.vim
mkdir $HOME/.vim/colors
ln -s $HOME/.dotfiles/vim/monokai.vim $HOME/.vim/colors/monokai.vim

# Install Vim plugins and copy snippets over.
vim +PlugInstall +qall
rm -rf $HOME/.vim/plugged/vim-snippets/snippets/c.snippets
ln -s $HOME/.dotfiles/vim/c.snippets $HOME/.vim/plugged/vim-snippets/snippets/c.snippets

echo "done!"
