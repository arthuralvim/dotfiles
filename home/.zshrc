# zsh configuration file
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="alvim"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(bower common-aliases extract git git-extras history httpie sublime web-search macos docker kubectl)

# zsh completions
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

setopt ignoreeof # No exit on ctrl+d
unsetopt nomatch # "5*7" without quoting
unsetopt extended_history
unsetopt share_history

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# zprof  # remove for profiling
