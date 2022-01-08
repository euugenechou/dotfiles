# Functions

function mkcd() {
    mkdir -p "$1" && cd "$1";
}

function chpwd() {
    emulate -L zsh
    ls -lh
}

function movtomp4() {
    ffmpeg -i "$@" -vcodec h264 -acodec aac "${@%.mov}.mp4"
}
