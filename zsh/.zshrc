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

# Cute "fortune".
if [ -x "$(command -v fortune)" > /dev/null 2>&1 ]; then
  if [ -x "$(command -v cowsay)" > /dev/null 2>&1 ]; then
    fortune -s | cowsay -f small
  else
    fortune -s
  fi
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f "/Users/Eugene/.ghcup/env" ] && source "/Users/Eugene/.ghcup/env" # ghcup-env
