# Theme
ZSH_THEME="spaceship"

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Path to dotfiles
export DOTFILES=$HOME/.dotfiles

# Language environment
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# Terminal environment
export TERM=xterm-256color

# Environment variables
# export DB_USER=Eugene
# export DB_NAME=nightmarket

# Plugins
plugins=(zsh-syntax-highlighting)

# Automatically update oh-my-zsh
export UPDATE_ZSH_DAYS=14

# Set dotfiles as oh-my-zsh custom folder
ZSH_CUSTOM=$DOTFILES

source $ZSH/oh-my-zsh.sh
