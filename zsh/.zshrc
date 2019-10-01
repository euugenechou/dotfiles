# Set theme
ZSH_THEME="yoink"

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
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='mvim'
fi

# Environment variables
# export DB_USER=Eugene
# export DB_NAME=nightmarket

# Plugins
plugins=(zsh-syntax-highlighting vi-mode)

# Automatically update oh-my-zsh
export UPDATE_ZSH_DAYS=14

# Set dotfiles as oh-my-zsh custom folder
ZSH_CUSTOM=$DOTFILES/zsh

source $ZSH/oh-my-zsh.sh
