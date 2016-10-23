#!/bin/bash

source common/functions.sh

# profile/clean.sh

for file in {aliases,bashrc,exports,extra,functions,paths,inputrc,profile};
do
    if [ -f $HOME/.$file ]; then
        rm $HOME/.$file
    fi

    if [ -L $HOME/.$file ]; then
        msg_alert "Updating $HOME/.$file"
        rm $HOME/.$file
    fi
done
unset file

msg_alert "For use on this session, type: source ~/.bashrc or ~/.zshrc"
