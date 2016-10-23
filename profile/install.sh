#!/bin/bash

source common/functions.sh

# profile/install.sh

source profile/clean.sh

for file in {aliases,bashrc,exports,extra,functions,paths,inputrc,profile};
do
    if [ -L $HOME/.$file ]; then
        msg_installing "Updating $HOME/.$file"
        rm $HOME/.$file
        ln -s $DOTFILES_DIR/profile/.$file $HOME/.$file
    else
        msg_installing "Installing $HOME/.$file"
        ln -s $DOTFILES_DIR/profile/.$file $HOME/.$file
    fi
done
unset file

msg_alert "For use on this session, type: source ~/.bashrc or ~/.zshrc"
