#!/bin/bash

source common/functions.sh

msg ' ______     ______     ______   __  __     __  __     ______        ______     __         __   __   __     __    __    '
msg '/\  __ \   /\  == \   /\__  _\ /\ \_\ \   /\ \/\ \   /\  == \      /\  __ \   /\ \       /\ \ / /  /\ \   /\  -./  \   '
msg '\ \  __ \  \ \  __<   \/_/\ \/ \ \  __ \  \ \ \_\ \  \ \  __<      \ \  __ \  \ \ \____  \ \ \ /   \ \ \  \ \ \-./\ \  '
msg ' \ \_\ \_\  \ \_\ \_\    \ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\     \ \_\ \_\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\ '
msg '  \/_/\/_/   \/_/ /_/     \/_/   \/_/\/_/   \/_____/   \/_/ /_/      \/_/\/_/   \/_____/   \/_/      \/_/   \/_/  \/_/ '
msg ''

if [[ -d "$DOTFILES_DIR" ]]; then
    msg_checking "Checking dotfiles directory"
else
    msg_install "Cloning" "git@github.com:arthuralvim/dotfiles.git"
    git clone https://github.com/arthuralvim/dotfiles.git $DOTFILES_DIR
    msg_ok "OK"
fi

cd $DOTFILES_DIR

sh all/basic.sh
