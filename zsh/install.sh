#!/bin/bash

source common/functions.sh

# zsh

if which zsh &> /dev/null; then
    msg_checking "zsh"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "zsh" "apt-get install zsh"
        apt-get install -y curl zsh
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "zsh" "brew install zsh"
        brew install 'curl'
        brew install 'zsh'
        brew install 'zsh-completions'
        msg_ok "OK"
    fi

    git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"

fi

# oh-my-zsh

if [ ! -L "$HOME/.zshrc" ]; then
    msg_installing ".zshrc and theme"
    ln -s $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc
    curl -L https://gist.githubusercontent.com/arthuralvim/c894bbe096ad4b856345/raw/cbf964e4d623bec2766dfffd47c43571868b819c/alvim.zsh-theme -o "$HOME/.oh-my-zsh/themes/alvim.zsh-theme"
    # chsh -s /bin/zsh
fi
