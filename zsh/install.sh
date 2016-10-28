#!/bin/bash

source common/functions.sh

# zsh

if which zsh &> /dev/null; then
    msg_checking "zsh"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "zsh" "apt-get install zsh"
        apt-get install -qq -y curl zsh
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "zsh" "brew install zsh"
        brew install 'curl'
        brew install 'zsh'
        brew install 'zsh-completions'
        msg_ok "OK"
    fi

fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
fi

if [ -f "$HOME/.oh-my-zsh/themes/alvim.zsh-theme" ]; then
    msg_ok "theme OK"
else
    msg_installing "theme"
    curl -L https://gist.githubusercontent.com/arthuralvim/c894bbe096ad4b856345/raw/cbf964e4d623bec2766dfffd47c43571868b819c/alvim.zsh-theme -o "$HOME/.oh-my-zsh/themes/alvim.zsh-theme"
fi

if [ -L "$HOME/.zshrc" ]; then
    msg_ok ".zshrc OK (reinstall + backuping old one)"
    mv $HOME/.zshrc "$HOME/.zshrc.$now.backup"
    ln -s $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc
else 
    msg_installing ".zshrc"
    ln -s $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc
fi

if [ ! "$SHELL" = "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi
