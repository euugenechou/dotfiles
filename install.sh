#!/usr/bin/env bash

all=false

modules=(
    "alacritty"
    "nvim"
    "tmux"
    "yabai"
    "zsh"
)

wanted=()

while getopts "ah" opt; do
  case $opt in
    a)
        all=true
        ;;
    h)
        echo "usage: $0 [-a] [-h] [alacritty,nvim,tmux,yabai,zsh]+"
        exit 0
        ;;
  esac
done
shift "$((OPTIND-1))"

if $all; then
    wanted="${modules[@]}"
else
    wanted="$@"
fi

for module in $wanted; do
    echo -n "Installing $module... "
    git submodule update --init $module && cd "$module" && ./install.sh
    echo "done."
done
