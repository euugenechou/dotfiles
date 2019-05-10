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
alias flactoalac="for f in ./*.flac; do ffmpeg -i "$f" -c:a alac "${f%.*}.m4a"; done"
alias freebsd="ssh euchou@127.0.0.1 -p2222"
alias mp3-dl="youtube-dl --extract-audio --audio-format mp3"
alias fuck="say -v Kyoko やばい"

# School
alias unix="ssh euchou@unix.ucsc.edu"
alias remote="sshfs euchou@unix.ucsc.edu:/afs/cats.ucsc.edu/users/k/euchou/ ~/Timeshare"
alias grunhilda="ssh euchou@grunhilda.soe.ucsc.edu"

# Editor
alias vi='vim'

# Config
alias vimconfig="vi ~/.vimrc"
alias zshconfig="vi ~/.zshrc"
alias hyperconfig="vi ~/.hyper.js"
alias chunkwmconfig="vi ~/.chunkwmrc"
alias skhdconfig="vi ~/.skhdrc"
alias dotfiles="cd ~/.dotfiles"
