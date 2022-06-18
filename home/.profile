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
export DROPBOX_HOME=$HOME
export DOTFILES_DIR="$HOME/.dotfiles"
export HOMEBREW_PREFIX=$(brew --prefix)/opt

[ -d $DROPBOX_HOME/Work ] || mkdir -p $DROPBOX_HOME/Work
export PROJECT_HOME=$DROPBOX_HOME/Work

[ -d $HOME/.virtualenvs ] || mkdir -p $HOME/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs

export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_HOME=/opt/homebrew-cask/Caskroom/android-sdk/3859397,26.0.2
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# encoding
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# history
export FIGNORE=.DS_Store
export HISTFILE=$HOME/.history
export HISTSIZE=10000
export HISTFILESIZE=$HISTSIZE
export HISTIGNORE="ls:cd:exit"

# brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# node
export NODE_PATH="/usr/local/lib/node_modules"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true

# virtualenv wrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--distribute --no-site-packages"

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

export HOMESHICK_DIR=/usr/local/opt/homeshick
source "/usr/local/opt/homeshick/homeshick.sh"

export AWS_SHARED_CREDENTIALS_FILE=/Users/arthuralvim/.aws/credentials

if which fzf &> /dev/null; then
    [[ $- == *i* ]] && source "$HOMEBREW_PREFIX/fzf/shell/completion.zsh" 2> /dev/null
    source "$HOMEBREW_PREFIX/fzf/shell/key-bindings.zsh"
fi
    # [[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# added by pipsi (https://github.com/mitsuhiko/pipsi)
# export PATH="/Users/arthuralvim/.local/bin:$PATH"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# export PIPENV_IGNORE_VIRTUALENVS=1
# export PYSPARK_DRIVER_PYTHON=jupyter
# export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
# export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"
# export PYSPARK_PYTHON=/Users/arthuralvim/.pyenv/versions/curso_extensao_machine_learning/bin/python
# export PIP_REQUIRE_VIRTUALENV=true

#  ______   ______     ______   __  __     ______
# /\  == \ /\  __ \   /\__  _\ /\ \_\ \   /\  ___\
# \ \  _-/ \ \  __ \  \/_/\ \/ \ \  __ \  \ \___  \
#  \ \_\    \ \_\ \_\    \ \_\  \ \_\ \_\  \/\_____\
#   \/_/     \/_/\/_/     \/_/   \/_/\/_/   \/_____/


# Directories to be prepended to PATH
dirs_to_prepend=(
    "$HOME/.local/bin"
    "$PYENV_ROOT/shims"
)

# Directories to be appended to PATH
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
    "$HOMEBREW_PREFIX/node/bin"
    "$HOMEBREW_PREFIX/fzf/bin"
    "$HOMEBREW_PREFIX/go/bin"
    "/Applications/Postgres.app/Contents/Versions/latest/bin"
    "/Applications/MongoDB.app/Contents/Resources/Vendor/mongodb/bin"
    "/Applications/RabbitMQ.app/Contents/Resources/Vendor/rabbitmq/sbin"
    "/Applications/Redis.app/Contents/Resources/Vendor/redis/bin"
    "/Applications/Docker.app/Contents/Resources/bin"
)

# Prepend directories to PATH
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
alias projects="cd $PROJECT_HOME"
alias work="cd $PROJECT_HOME/pluralsight"
alias drp="cd $HOME/Dropbox"
alias dotfiles="cd $HOME/.dotfiles"
alias dotfiles.open="subl $HOME/.dotfiles"
alias dwl="cd $HOME/Downloads"
alias doc="cd $HOME/Documents"
alias pic="cd $HOME/Pictures"
alias mov="cd $HOME/Movies"
alias mus="cd $HOME/Music"
alias hm="homeshick"

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

# python
alias ipy="ipython"
alias ipy3="ipython3"
alias pyt="python"
alias py3="python3"
alias pipin='pip install'
alias pipf='pip freeze'
alias asjson='python -m json.tool'
alias pyserver='python -m SimpleHTTPServer'
alias delpyc='find . -iname "*.pyc" -exec rm {} \; ; find . -type d -iname __pycache__ -exec rm -r {} \;'

# pyenv
alias pyenvs="pyenv install -l"
alias pyvienvs="pyenv virtualenvs"

# virtualenvwrapper
alias mkvirtualenv3="mkvirtualenv -p python3"
alias mkvirtualenv2="mkvirtualenv -p python2"

# python/django
alias pym="python manage.py"
alias pymm="python manage.py migrate"
alias pymr="python manage.py runserver"
alias pyms="python manage.py shell"
alias pymt="python manage.py test"
alias pymod="touch __init__.py admin.py models.py tests.py views.py urls.py"
alias grepipdb="grep -n 'import ipdb;' -R . | grep -v '#'"

alias a=activate
alias d=deactivate
alias xx='exit'

#httpie
alias 'GET=http -v GET'
alias 'POST=http -v POST'
alias 'PUT=http -v PUT'
alias 'PATCH=http -v PATCH'
alias 'DELETE=http -v DELETE'
alias 'OPTION=http -v OPTION'

# ansible
alias ag="ansible-galaxy"

# touch
alias touchall="find . -exec touch {} \;"

# vagrant
alias vaup="vagrant up"
alias vaha="vagrant halt"
alias vapro="vagrant provision"
alias vade="vagrant destroy"
alias vast="vagrant status"
alias vash="vagrant ssh"
alias vashc="vagrant ssh-config"
alias valist="vagrant box list"

# ruby
alias sgi='sudo gem install --no-ri --no-rdoc'

# git
alias gpush='git push origin master'
alias gpull='git pull --ff-only origin master'
alias gcl="git ls-files | xargs wc -l"
alias gc='git commit'
alias gcv='git commit --no-verify'

# ohmyzsh
alias ohmyzsh="subl ~/.oh-my-zsh"
alias zshcfg="subl ~/.zshrc"

# apps
alias elastic="elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml"
alias rabbit="rabbitmq-server"
alias nginx_test="nginx -c /etc/nginx/nginx.conf -t"
alias redis="redis-server /usr/local/etc/redis.conf"
alias mongorun='mongod --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf &'

# npm
alias nt='npm test'
alias np='npm publish'
alias nrb='npm run build'
alias nrc='npm run cover'
alias nrr='npm run report'
alias ni='npm install'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nig='npm install -g'
alias nd='node-debug'
alias nm='nodemon'
alias ndm='node-debug node_modules/.bin/_mocha'
alias nu='npm update'
alias nug='npm update -g'
alias ns='npm start'

# bower
alias bi='bower install'
alias bu='bower update'
alias bug='bower install -g'
alias bis='bower install --save'
alias bisd='bower install --save-dev'
alias bp='bower register'

# grunt
alias gr='grunt'
alias grb='grunt build'
alias grbs='grunt build:stage'
alias grbp='grunt build:production'
alias grds='grunt deploy:stage'
alias grdp='grunt deploy:production'

# gulp
alias gub='gulp build'
alias gur='gulp release'

# jekyll
alias jky='jekyll serve -w'

# networking
alias local-ip-all="ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'"
alias local-ip="ipconfig getifaddr en0"
alias ipext='dig +short myip.opendns.com @resolver1.opendns.com'
alias mac-adresses='networksetup -listallhardwareports'

if [[ $platform == 'linux' ]]; then
  alias procports='netstat -tulpn'
elif [[ $platform == 'darwin' ]]; then
  alias procports='lsof -nPi -sTCP:LISTEN'
  "lsof -i tcp:${PORT_NUMBER} | awk 'NR!=1 {print $2}' | xargs kill"
fi

alias ssh-pub-key='cat $HOME/.ssh/id_rsa.pub'

# wheater
alias weather-nyc='curl "http://wttr.in/New+York"'
alias weather-rec='curl "http://wttr.in/Recife"'

# env
alias show-env-vars='printenv'

# utils
alias o="open"
alias -g gp='| grep -i'
alias rm='rm -i'
alias usuarios="cut -d: -f1 /etc/passwd"
alias c="clear"
alias clipboard='pbcopy'
alias top='htop'
alias youtube='youtube-dl -t'
alias psg='ps aux | grep'
alias pg='echo "USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND" && ps aux | grep -i'
alias ports='sudo lsof -i -P | grep -i "listen"'
alias cls='clear;ls'
alias deldss='find . -name '.DS_Store' -type f -delete'

# disk
alias disk_usage='df -h'
alias dush='du -sh'
alias ducks='du -cks * | sort -rn | head -n 10'
alias duha='du -ha * | sort -rn | head -n 10'

# compress
alias tf='tail -f'
alias gz='tar -zcvf'

# kill
alias ka9='killall -9'
alias k9='kill -9'

# dns
alias clear-dns-cache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# homebrew
alias brewdo="brew doctor"
alias brewin="brew install"
alias brewun="brew uninstall"
alias brewse="brew search"
alias brewcl="brew cleanup && brew cask cleanup"
alias brewup="brew update && brew upgrade --all"

# services
# init-checkconf /etc/init/job.conf
# initctl list

tutu
