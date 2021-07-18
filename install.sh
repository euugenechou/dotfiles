#!/bin/sh

echo "Setting up Eugene's environment..."

# Install Zsh if it doesn't yet exist.
if test ! $(which zsh); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install oh-my-zsh if it doesn't yet exist.
if ! test -d "$HOME/.oh-my-zsh"; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Link Zsh config.
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Link milktea theme.
rm -rf $HOME/.oh-my-zsh/themes/milktea.zsh-theme
ln -s $HOME/.dotfiles/zsh/milktea.zsh-theme $HOME/.oh-my-zsh/themes/milktea.zsh-theme

# Install Zsh plugins.
rm -rf $HOME/.dotfiles/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting

# Link Vim config.
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc

# Clean out original Vim config.
rm -rf $HOME/.vim
mkdir $HOME/.vim

# Link Vim color scheme.
mkdir $HOME/.vim/colors
ln -s $HOME/.dotfiles/vim/monokai.vim $HOME/.vim/colors/monokai.vim

# Link C and C++  extended syntax file.
mkdir $HOME/.vim/after
mkdir $HOME/.vim/after/syntax
ln -s $HOME/.dotfiles/vim/c.vim $HOME/.vim/after/syntax/c.vim
ln -s $HOME/.dotfiles/vim/cpp.vim $HOME/.vim/after/syntax/cpp.vim

# Install Vim plugins and copy snippets over.
vim +PlugInstall +qall
rm -rf $HOME/.vim/plugged/vim-snippets/UltiSnips/c.snippets
ln -s $HOME/.dotfiles/vim/c.snippets $HOME/.vim/plugged/vim-snippets/UltiSnips/c.snippets
ln -s $HOME/.dotfiles/vim/cpp.snippets $HOME/.vim/plugged/vim-snippets/UltiSnips/cpp.snippets

echo "Restart terminal and switch to zsh shell to see changes."
