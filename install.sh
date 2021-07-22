#!/bin/bash

echo "Setting up Eugene's environment..."

# Install Zsh if it doesn't yet exist.
if ! command -v zsh; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Install oh-my-zsh if it doesn't yet exist.
if ! test -d "$HOME/.oh-my-zsh"; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Link zsh config.
ln -sf $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Link milktea theme.
ln -sf $HOME/.dotfiles/zsh/milktea.zsh-theme $HOME/.oh-my-zsh/themes/milktea.zsh-theme

# Install Zsh plugins.
rm -rf $HOME/.dotfiles/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting

# Link nvim configuration.
rm -rf $HOME/.config/nvim
ln -sf $HOME/.dotfiles/nvim $HOME/.config/nvim

# Link kitty configuration.
rm -rf $HOME/.config/kitty
ln -sf $HOME/.dotfiles/kitty $HOME/.config/kitty

# Link window manager configuration.
ln -sf $HOME/.dotfiles/yabai/.skhdrc $HOME/.skhdrc
ln -sf $HOME/.dotfiles/yabai/.yabairc $HOME/.yabairc

# Install nvim plugins and copy snippets over.
nvim +PlugInstall +qall

echo "Restart terminal and switch to zsh shell to see changes."
