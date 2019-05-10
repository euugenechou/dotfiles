### Aliases

# Shell
alias ax="chmod a+x"
alias back='cd "$OLDPWD"'
alias c="clear"
alias home='cd ~'
alias la="ls -a"
alias rm="rm -f"
alias src="source ~/.zshrc"

# System
alias clearlogs="sudo rm -f ~/private/var/log/asl/*.asl"
alias finder="open -a Finder"

# PostgreSQL
alias psqlstart="pg_ctl -D /usr/local/var/postgres start"
alias psqlstop="pg_ctl -D /usr/local/var/postgres stop"

# Miscallaneous
alias freebsd="ssh euchou@127.0.0.1 -p2222"
alias mp3-dl="youtube-dl --extract-audio --audio-format mp3"
alias fuck="say -v Kyoko やばい"

# School
alias unix="ssh euchou@unix.ucsc.edu"
alias grunhilda="ssh euchou@grunhilda.soe.ucsc.edu"
alias remote="sshfs euchou@unix.ucsc.edu:/afs/cats.ucsc.edu/users/k/euchou ~/Timeshare"

# Editor
alias vi='vim'

# Config
alias vimconfig="vi ~/.vimrc"
alias zshconfig="vi ~/.zshrc"
alias fishconfig="vi ~/.config/fish/conf.d/omf.fish"
alias omfdir="cd $OMF_CONFIG"
alias hyperconfig="vi ~/.hyper.js"
alias chunkwmconfig="vi ~/.chunkwmrc"
alias skhdconfig="vi ~/.skhdrc"
alias dotfiles="cd ~/.dotfiles"

