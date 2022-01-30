#!/bin/bash

function install_zsh() {
    # Install shell if it doesn't yet exist.
    if ! command -v zsh > /dev/null; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi

    # Install oh-my-zsh if it doesn't yet exist.
    if ! test -d "$HOME/.oh-my-zsh"; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    # Install zplug if it doesn't yet exist.
    git clone https://github.com/zplug/zplug $HOME/.zplug

    # Link zsh config and theme.
    ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
    ln -sf $HOME/.dotfiles/zsh/milktea.zsh-theme $HOME/.oh-my-zsh/themes/milktea.zsh-theme
}

function install_nvim() {
    # Link configuration.
    rm -rf "$HOME/.config/nvim"
    ln -sf "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"

    # Install plugins.
    nvim +PlugInstall +qall
}

function install_kitty() {
    # Link configuration.
    rm -rf "$HOME/.config/kitty"
    ln -sf "$HOME/.dotfiles/kitty" "$HOME/.config/kitty"
}

function install_yabai() {
    # Link configuration.
    ln -sf "$HOME/.dotfiles/yabai/.skhdrc" "$HOME/.skhdrc"
    ln -sf "$HOME/.dotfiles/yabai/.yabairc" "$HOME/.yabairc"
}

function install_tmux() {
    # Install tmux configuration.
    ln -sf "$HOME/.dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
    ln -sf "$HOME/.dotfiles/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"
}

if [[ $# -lt 1 ]]; then
    echo "usage: $0 --[all, zsh, nvim, kitty, tmux]"
fi

zsh=false
nvim=false
kitty=false
yabai=false
tmux=false

for i in "$@"; do
    case $i in
        -z|--zsh)
            zsh=true
            ;;
        -n|--nvim)
            nvim=true
            ;;
        -k|--kitty)
            kitty=true
            ;;
        -y|--yabai)
            yabai=true
            ;;
        -t|--tmux)
            tmux=true
            ;;
        -a|--all)
            zsh=true
            nvim=true
            kitty=true
            yabai=true
            tmux=true
            ;;
    esac
done

if $zsh; then
    echo "Installing zsh."
    install_zsh
    echo "Installed zsh (remember to restart for changes)."
fi

if $nvim; then
    echo "Installing nvim."
    install_nvim
    echo "Installed nvim."
fi

if $kitty; then
    echo "Installing kitty."
    install_kitty
    echo "Installed kitty."
fi

if $yabai; then
    echo "Installing yabai."
    install_yabai
    echo "Installed yabai."
fi

if $tmux; then
    echo "Installing tmux."
    install_tmux
    echo "Installed tmux."
fi
