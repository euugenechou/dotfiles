# Set theme
ZSH_THEME="milktea"

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Path to dotfiles
export DOTFILES=$HOME/.dotfiles

# Language environment
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# Terminal environment
export TERM=xterm-256color

# Set editor for local/remote
export EDITOR='vim'

# Plugins
plugins=(zsh-syntax-highlighting zsh-autosuggestions vi-mode)

# Automatically update oh-my-zsh
export UPDATE_ZSH_DAYS=14

# Set dotfiles as oh-my-zsh custom folder
ZSH_CUSTOM=$DOTFILES/zsh

source $ZSH/oh-my-zsh.sh

# Custom keybindings.
bindkey '^F' autosuggest-accept

# Cute "fortune".
if [ -x "$(command -v fortune)" > /dev/null 2>&1 ]; then
    if [ -x "$(command -v cowsay)" > /dev/null 2>&1 ]; then
        fortune -s | cowsay -f neo
    else
        fortune -s
    fi
fi
