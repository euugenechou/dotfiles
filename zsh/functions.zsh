# Functions

function mkcd() {
    mkdir -p "$@" && cd "$@";
}

function rmextension() {
    find . -name "*.$@" -type f -delete;
}

function mkcppenv() {
    mkdir -p "$@" && cd "$@";
    cp $HOME/.dotfiles/makefiles/Makefile.cpp Makefile
}

function mkvirtualenvpy3() {
    python3 -m venv .
    source bin/activate
}

function chpwd() {
    emulate -L zsh
    ls
}
