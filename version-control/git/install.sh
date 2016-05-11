#!/bin/bash

source common/functions.sh

# git

if which git &> /dev/null; then
    msg_checking "git"
else
    if [ "$LINUX" = "linux" ]; then
        msg_install "git" "apt-get install git git-core"
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "git" "brew install git"
        brew install git
        brew install git-extras
        brew install git-cal
        brew install git-flow
        brew install meld
        msg_ok "OK"
    fi
fi

# .gitconfig

if [ ! -L "$HOME/.gitconfig" ]; then
    msg_installing ".gitconfig"
    ln -s $DOTFILES_DIR/version-control/git/.gitconfig $HOME/.gitconfig
    msg_installing ".git-commit-template"
    git config --global commit.template "${DOTFILES_DIR}/version-control/git/git-commit-template.txt"
    msg_installing ".git-init-template"
    git config --global init.templatedir "${DOTFILES_DIR}/version-control/git/init_template"
    msg_installing ".global-gitignore"
    git config --global core.excludesfile "${DOTFILES_DIR}/version-control/git/.global_gitignore"
fi
