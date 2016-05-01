#!/bin/bash

source common/functions.sh

msg ' ______     ______     ______   __  __     __  __     ______        ______     __         __   __   __     __    __    '
msg '/\  __ \   /\  == \   /\__  _\ /\ \_\ \   /\ \/\ \   /\  == \      /\  __ \   /\ \       /\ \ / /  /\ \   /\  -./  \   '
msg '\ \  __ \  \ \  __<   \/_/\ \/ \ \  __ \  \ \ \_\ \  \ \  __<      \ \  __ \  \ \ \____  \ \ \ /   \ \ \  \ \ \-./\ \  '
msg ' \ \_\ \_\  \ \_\ \_\    \ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\     \ \_\ \_\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\ '
msg '  \/_/\/_/   \/_/ /_/     \/_/   \/_/\/_/   \/_____/   \/_/ /_/      \/_/\/_/   \/_____/   \/_/      \/_/   \/_/  \/_/ '
msg ''


OSX=$(test "`uname`" == "Darwin" && echo "x")

if [[ -d "$HOME/Dropbox/dotfiles" ]]; then
    msg_checking "Checking dotfiles directory"
else
    msg_install "Cloning" "git@github.com:arthuralvim/dotfiles.git"
    git clone git@github.com:arthuralvim/dotfiles.git $HOME/Dropbox/dotfiles
    msg_ok "OK"
fi

# cd $HOME/Dropbox/dotfiles

sh brew/install.sh
# sh common/install.sh
# sh front/install.sh
# sh git/install.sh
# sh osx/install.sh
# sh profile/install.sh
# sh ruby/install.sh
# sh sublime-text/install.sh
# sh vim/install.sh
# sh zsh/install.sh
