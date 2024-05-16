#  ______     ______     __  __     ______     __   __     __   __
# /\___  \   /\  ___\   /\ \_\ \   /\  ___\   /\ "-.\ \   /\ \ / /
# \/_/  /__  \ \___  \  \ \  __ \  \ \  __\   \ \ \-.  \  \ \ \'/
#   /\_____\  \/\_____\  \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \__|
#   \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_/ \/_/   \/_/

zmodload zsh/stat
zmodload zsh/datetime
zmodload zsh/mathfunc
zmodload zsh/zprof

[[ -s "$HOME/.common" ]] && source "$HOME/.common"

#  ______     __  __     ______   ______     ______     ______   ______
# /\  ___\   /\_\_\_\   /\  == \ /\  __ \   /\  == \   /\__  _\ /\  ___\
# \ \  __\   \/_/\_\/_  \ \  _-/ \ \ \/\ \  \ \  __<   \/_/\ \/ \ \___  \
#  \ \_____\   /\_\/\_\  \ \_\    \ \_____\  \ \_\ \_\    \ \_\  \/\_____\
#   \/_____/   \/_/\/_/   \/_/     \/_____/   \/_/ /_/     \/_/   \/_____/

# general
export DOTFILES_DIR="$HOME/.homesick/repos/dotfiles"
eval "$(/opt/homebrew/bin/brew shellenv)"

export HOMESHICK_DIR=/opt/homebrew/opt/homeshick
source "/opt/homebrew/opt/homeshick/homeshick.sh"

[ -d $HOME/Work ] || mkdir -p $HOME/Work
export PROJECT_HOME=$HOME/Work

# gpg
export GPG_TTY=$(tty)

# java
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# node / nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# python / pyenv
[ -d $HOME/.virtualenvs ] || mkdir -p $HOME/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# pip/pipenv/pipx
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
[ -d $HOME/.pip/cache ] || mkdir -p $HOME/.pip/cache
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
[ -d $HOME/.pip/pyenv/cache ] || mkdir -p $HOME/.pip/pyenv/cache
export PYENV_DOWNLOAD_CACHE=$HOME/.pip/pyenv/cache
export PIPENV_CACHE_DIR=$HOME/.pipenv/cache
export PIP_DISABLE_CACHE=true

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# aws
export AWS_SHARED_CREDENTIALS_FILE=/Users/arthuralvim/.aws/credentials

# fuzzyfinder
if which fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi

#  ______   ______     ______   __  __     ______
# /\  == \ /\  __ \   /\__  _\ /\ \_\ \   /\  ___\
# \ \  _-/ \ \  __ \  \/_/\ \/ \ \  __ \  \ \___  \
#  \ \_\    \ \_\ \_\    \ \_\  \ \_\ \_\  \/\_____\
#   \/_/     \/_/\/_/     \/_/   \/_/\/_/   \/_____/


# directories to be prepended to PATH
dirs_to_prepend=(
    "$HOME/.local/bin"
    "$PYENV_ROOT/shims"
)

# directories to be appended to PATH
dirs_to_append=(
    "/bin"
    "/sbin"
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/usr/sbin"
    "/usr/textbin"
    "/opt/X11/bin"
    "$HOME/bin"
    "$HOME/.rvm/bin"
    "$HOME/.jenv/bin"
    "$HOMEBREW_PREFIX/node/bin"
    "$HOMEBREW_PREFIX/fzf/bin"
    "$HOMEBREW_PREFIX/go/bin"
    "$HOMEBREW_PREFIX/llvm@9/bin"
    "/Applications/Docker.app/Contents/Resources/bin"
)

# prepend directories to PATH
for index in "${(@k)dirs_to_prepend}"; do
    if [ -d "$index" ]; then
        # If these directories exist, then prepend them to existing PATH
        [[ ":$PATH:" != *":$index:"* ]] && PATH="$index:$PATH"
    fi
done

# Append directories to PATH
for index in "${(@k)dirs_to_append}"; do
    if [ -d "$index" ]; then
        # If these bins exist, then append them to existing PATH
        [[ ":$PATH:" != *":$index:"* ]] && PATH="$PATH:$index"

    fi
done

unset dirs_to_prepend dirs_to_append

export PATH

#  ______     __         __     ______     ______     ______     ______
# /\  __ \   /\ \       /\ \   /\  __ \   /\  ___\   /\  ___\   /\  ___\
# \ \  __ \  \ \ \____  \ \ \  \ \  __ \  \ \___  \  \ \  __\   \ \___  \
#  \ \_\ \_\  \ \_____\  \ \_\  \ \_\ \_\  \/\_____\  \ \_____\  \/\_____\
#   \/_/\/_/   \/_____/   \/_/   \/_/\/_/   \/_____/   \/_____/   \/_____/


# aliases

# folders
alias home="cd $HOME"
alias pro="cd $PROJECT_HOME"
alias work="cd $PROJECT_HOME"
alias dotfiles="hm cd dotfiles"
alias hm="homeshick"
alias please='sudo'
alias porfavor='sudo'
alias xx='exit'

# list
alias ls="ls -Glha"
alias lsd='ls -Glha | grep "^d"'
alias lsf='ls -GSlha | grep "^-"'
alias tree='tree -Csu'

# navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# httpie
alias 'GET=http -v GET'
alias 'POST=http -v POST'
alias 'PUT=http -v PUT'
alias 'PATCH=http -v PATCH'
alias 'DELETE=http -v DELETE'
alias 'OPTION=http -v OPTION'

# ohmyzsh
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias zshcfg="$EDITOR ~/.zshrc"

# utils
alias o="open"
alias rm='rm -i'
alias clipboard='pbcopy'
alias top='htop'
alias youtube='youtube-dl -t'
alias psg='ps aux | grep -i'

# disk
alias disk_usage='df -h'
alias dush='du -sh'
alias ducks='du -cks * | sort -rn | head -n 10'
alias duha='du -ha * | sort -rn | head -n 10'

# kill
alias ka9='killall -9'
alias k9='kill -9'
alias pp7='kill -9'
alias gun='kill -9'
alias machine-gun='killall -9'

# zsh
alias ztheme='(){ export ZSH_THEME="$@" && source $ZSH/oh-my-zsh.sh }'

tutu

[[ -s "$HOME/.work" ]] && source "$HOME/.work"