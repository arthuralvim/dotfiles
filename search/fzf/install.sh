#!/bin/bash

source common/functions.sh

# fzf

if which fzf &> /dev/null; then
    msg_checking "fzf"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "fzf" "git clone-get install fzf"
        git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
        cd $HOME/.fzf
        sh install
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "zsh" "brew install fzf"
        brew install 'fzf'
        cd `$(brew --prefix)/opt/fzf/`
        sh install
        msg_ok "OK"
    fi
fi
