# zsh configuration file
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(git brew osx)

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# virtualenvwrapper
source $(which virtualenvwrapper.sh)

# Load the exports, functions, aliases and extra dotfiles.
for file in ~/.{exports,functions,aliases,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
