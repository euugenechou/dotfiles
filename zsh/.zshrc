# Set theme
ZSH_THEME="milktea"

# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Path to dotfiles
export DOTFILES=$HOME/.dotfiles

# Language environment
export LC_ALL=en_US.utf-8
export LANG="$LC_ALL"

# Set editor for local/remote
export EDITOR='nvim'

# Plugins
plugins=(zsh-syntax-highlighting zsh-autosuggestions vi-mode)

# Automatically update oh-my-zsh
export UPDATE_ZSH_DAYS=14

# Set dotfiles as oh-my-zsh custom folder
ZSH_CUSTOM=$DOTFILES/zsh

source $ZSH/oh-my-zsh.sh

# Don't autocd.
unsetopt autocd

# Custom keybindings.
bindkey '^F' autosuggest-accept
bindkey ' ' magic-space
bindkey '^L' forward-word
bindkey '^H' backward-word

# Show TODOs.
if [ -x "$(command -v task)" &> /dev/null ]; then
  task list
fi

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env
[ -f "$HOME/.ghcup/env" ] && source $HOME/.ghcup/env
