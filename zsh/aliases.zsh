# Shortcuts
alias back='cd "$OLDPWD"'
alias c="clear"

# macOS
alias finder="open -a Finder"
alias safari="open -a Safari"
alias typora="open -a Typora"

# Zsh
alias zshsrc="source ~/.zshrc"
alias zshaliases="vi ~/.dotfiles/zsh/aliases.zsh"
alias zshconf="vi ~/.dotfiles/zsh/.zshrc"
alias zshenv="vi ~/.dotfiles/zsh/env.zsh"
alias zshfuncs="vi ~/.dotfiles/zsh/functions.zsh"
alias zshpaths="vi ~/.dotfiles/zsh/paths.zsh"

# Terminal
alias kittyconf="vi ~/.dotfiles/kitty/kitty.conf"
alias kittycolors="vi ~/.dotfiles/kitty/colors.conf"

# tmux
alias tmuxconf="vi ~/.tmux.conf.local"

# Editor
alias vi="nvim"
alias vim="nvim"
alias nvimconf="vi ~/.dotfiles/nvim/init.vim"
alias nvimplugins="vi ~/.dotfiles/nvim/plugins.vim"
alias nvimmappings="vi ~/.dotfiles/nvim/mappings.vim"
alias nvimfiletypes="vi ~/.dotfiles/nvim/filetypes.vim"
alias nvimsettings="vi ~/.dotfiles/nvim/settings.vim"
alias nvimlsp="vi ~/.dotfiles/nvim/lsp.vim"

# Tree
alias tree="tree --charset=utf-8"

# Window manager
alias yabaiconf="vi ~/.yabairc"
alias skhdconf="vi ~/.skhdrc"
alias wmstart="brew services start yabai; brew services start skhd;"
alias wmrestart="brew services restart yabai; brew services restart skhd;"
alias wmstop="brew services stop yabai; brew services stop skhd;"

# Miscallaneous
alias mp3-dl="youtube-dl --extract-audio --audio-format mp3"
alias texspellcheck="aspell --lang=en --mode=tex check"
alias python="python3"

# Kitty
alias icat="kitty +kitten icat"
