# zsh configuration file
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="half-life"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(bower common-aliases extract git git-extras history httpie sublime web-search macos docker kubectl tmux tmuxinator)

# zsh completions
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

setopt ignoreeof # No exit on ctrl+d
unsetopt nomatch # "5*7" without quoting
unsetopt extended_history
unsetopt share_history

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# tmux
# ZSH_TMUX_AUTOSTART=true
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
  export ZSH_TMUX_AUTOSTART=true
fi

# zprof  # remove for profiling