# zsh configuration file

ZSH=$HOME/.oh-my-zsh

ZSH_THEME="alvim"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(bower brew common-aliases django extract git git-extras history httpie sublime web-search osx)

# zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
