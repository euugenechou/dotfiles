#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check for Zsh and install if we don't have it
if test ! $(which zsh); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Update Homebrew recipes
# brew update

# Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
# brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Removes .zshrc from $HOME and symlinks the .zshrc file from .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Removes .vimrc from $HOME and symlinks the .vimrc file from .dotfiles
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

# Removes .hyper.js from $HOME and symlinks the .hyper.js file from .dotfiles
rm -rf $HOME/.hyper.js
ln -s $HOME/.dotfiles/.hyper.js $HOME/.hyper.js

# Removes monokai.vim from $HOME  and symlinks the monokai.vim file from .dotfiles
rm -rf $HOME/.vim/colors
mkdir $HOME/.vim/colors
ln -s $HOME/.dotfiles/monokai.vim $HOME/.vim/colors/monokai.vim


# Install Spaceship prompt
rm -rf $HOME/.dotfiles/themes/spaceship-prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git $HOME/.dotfiles/themes/spaceship-prompt
ln -s $HOME/.dotfiles/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.dotfiles/themes/spaceship.zsh-theme

# Install zsh-syntax-highlighting
rm -rf $HOME/.dotfiles/plugins
mkdir $HOME/.dotfiles/plugins
rm -rf $HOME/.dotfiles/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/plugins/zsh-syntax-highlighting


# Symlink the Mackup config file to the home directory
# ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos

source $HOME/.dotfiles/.zshrc

