#!/bin/bash

source common/functions.sh

# .osx

if [ "$OSX" = "osx" ]; then
    if [ ! -L "$HOME/.osx" ]; then
        msg_installing "$HOME/.osx"
        ln -s $DOTFILES_DIR/osx/.osx $HOME/.osx
        killall Finder
    fi
fi
