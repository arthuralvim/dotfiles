# zsh configuration file
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="alvim"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(bower common-aliases django extract git git-extras history httpie sublime web-search osx docker kubectl)

# zsh completions
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

setopt ignoreeof # No exit on ctrl+d
unsetopt nomatch # "5*7" without quoting
unsetopt extended_history
unsetopt share_history

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"


### ZNT's installer added snippet ###
# fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
# autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
# autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
# alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
# alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
# zle -N znt-history-widget
# bindkey '^R' znt-history-widget
# setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
# zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
### END ###
