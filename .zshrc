# zsh configuration file
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sorin"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(git brew osx)

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Load the exports, functions, aliases and extra dotfiles.
for file in ~/.{exports,functions,aliases,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
