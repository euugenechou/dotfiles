### Aliases

# Shell
alias ax="chmod a+x"
alias back='cd "$OLDPWD"'
alias c="clear"
alias home='cd ~'
alias la="ls -a"
alias rm="rm -f"
alias src="source ~/.zshrc"
alias code="cd ~/Documents/Code"

# System
alias clearlogs="sudo rm -f ~/private/var/log/asl/*.asl"
alias finder="open -a Finder"
alias safari="open -a Safari"
alias typora="open -a Typora"

# Miscallaneous
alias mp3-dl="youtube-dl --extract-audio --audio-format mp3"
alias texspellcheck="aspell --lang=en --mode=tex check"

# School
alias unix="ssh euchou@unix.ucsc.edu"
alias compilers="ssh euchou@192.249.113.232"
alias midgar="ssh euchou@localhost -p 5679"

# Python (big sigh)
alias python="python3"

# Config
alias vimconfig="vi ~/.dotfiles/nvim/init.vim"
alias zshconfig="vi ~/.dotfiles/zsh/.zshrc"
alias zshaliases="vi ~/.dotfiles/zsh/aliases.zsh"
alias zshfunctions="vi ~/.dotfiles/zsh/functions.zsh"
alias zshenv="vi ~/.dotfiles/zsh/env.zsh"
alias zshpaths="vi ~/.dotfiles/zsh/paths.zsh"
alias dotfiles="cd ~/.dotfiles"

# Editor
alias vi="nvim"
alias vim="nvim"

# Window manager
alias wmon="brew services start skhd; brew services start yabai"
alias wmoff="brew services stop skhd; brew services stop yabai"
