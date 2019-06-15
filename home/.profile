#  ______     ______     __  __     ______     __   __     __   __  
# /\___  \   /\  ___\   /\ \_\ \   /\  ___\   /\ "-.\ \   /\ \ / /  
# \/_/  /__  \ \___  \  \ \  __ \  \ \  __\   \ \ \-.  \  \ \ \'/   
#   /\_____\  \/\_____\  \ \_\ \_\  \ \_____\  \ \_\\"\_\  \ \__|   
#   \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_/ \/_/   \/_/    
                                                                  
zmodload zsh/stat
zmodload zsh/datetime
zmodload zsh/mathfunc
zmodload zsh/zprof

#  ______     ______     __    __     __    __     ______     __   __    
# /\  ___\   /\  __ \   /\ "-./  \   /\ "-./  \   /\  __ \   /\ "-.\ \   
# \ \ \____  \ \ \/\ \  \ \ \-./\ \  \ \ \-./\ \  \ \ \/\ \  \ \ \-.  \  
#  \ \_____\  \ \_____\  \ \_\ \ \_\  \ \_\ \ \_\  \ \_____\  \ \_\\"\_\ 
#   \/_____/   \/_____/   \/_/  \/_/   \/_/  \/_/   \/_____/   \/_/ \/_/ 
                                                                       

##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################

export OSX=$(test "`uname`" = "Darwin" && echo "osx")
export LINUX=$(test "`uname`" = "Linux" && echo "linux")
export DOTFILES_DIR="$HOME/.dotfiles"

now=$(date +"%m_%d_%Y__%H_%M_%S")

if [ "$LINUX" = "linux" ]; then
	function print { echo -e "\033[1;32m=> $1\033[0m"; }
	function msg_checking { echo -e "\033[1;32m=> $1 ✔\033[0m"; }
	function msg_installing { echo -e "\033[1;33m==> $1 [updating] ✔\033[0m"; }
	function msg_install { echo -e "\033[1;33m==> $1 [installing]: $ $2\033[0m"; }
	function msg_ok { echo -e "\033[1;32m==> $1 installed ✔\033[0m"; }
	function msg { echo -e "\033[0;32m$1\033[0m"; }
	function msg_alert { echo -e "\033[1;31m✖ $1 ✖\033[0m"; }
fi

if [ "$OSX" = "osx" ]; then
	function msg_checking { echo "\033[1;32m=> $1 ✔\033[0m"; }
	function msg_installing { echo "\033[1;33m==> $1 [updating] ✔\033[0m"; }
	function msg_install { echo "\033[1;33m==> $1 [installing]: $ $2\033[0m"; }
	function msg_ok { echo "\033[1;32m==> $1 installed ✔\033[0m"; }
	function msg { echo "\033[0;32m$1\033[0m"; }
	function msg_alert { echo "\033[1;31m✖ $1 ✖\033[0m"; }
fi

function file_to_array() {
    array=()
    while IFS= read -r line
    do
        array+=("$line")
    done < "$1"
}

#  ______     __  __     ______   ______     ______     ______   ______    
# /\  ___\   /\_\_\_\   /\  == \ /\  __ \   /\  == \   /\__  _\ /\  ___\   
# \ \  __\   \/_/\_\/_  \ \  _-/ \ \ \/\ \  \ \  __<   \/_/\ \/ \ \___  \  
#  \ \_____\   /\_\/\_\  \ \_\    \ \_____\  \ \_\ \_\    \ \_\  \/\_____\ 
#   \/_____/   \/_/\/_/   \/_/     \/_____/   \/_/ /_/     \/_/   \/_____/ 
                                                                         

# general
export EMAIL=afmalvim@gmail.com
export EDITOR=subl
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


# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
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

#  ______   __  __     __   __     ______     ______   __     ______     __   __     ______    
# /\  ___\ /\ \/\ \   /\ "-.\ \   /\  ___\   /\__  _\ /\ \   /\  __ \   /\ "-.\ \   /\  ___\   
# \ \  __\ \ \ \_\ \  \ \ \-.  \  \ \ \____  \/_/\ \/ \ \ \  \ \ \/\ \  \ \ \-.  \  \ \___  \  
#  \ \_\    \ \_____\  \ \_\\"\_\  \ \_____\    \ \_\  \ \_\  \ \_____\  \ \_\\"\_\  \/\_____\ 
#   \/_/     \/_____/   \/_/ \/_/   \/_____/     \/_/   \/_/   \/_____/   \/_/ \/_/   \/_____/ 
                                                                                             

function datedir(){
    echo `date '+%Y-%m-%d'`
    mkdir `date '+%Y-%m-%d'`
}

function mkcd () {
    mkdir -p "$@" && cd "$@"
}

# create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$@"
}

# kill process based on a file with its pid.
function kfpid {
    if [ -z "$1" ]; then
        echo "Digite o caminho para o arquivo com o pid."
    else
        kill $(cat $1)
    fi
}

# kill a group of pids based on a query.
function kgpid {
    if [ -z "$1" ]; then
        echo "type the query."
    else
        ps auxww | grep $1 | awk '{print $2}' | xargs kill -9
    fi
}

# create a django project using my project template
make_django_project(){
    django-admin.py startproject --template=https://github.com/arthuralvim/django-boot-template/archive/master.zip --extension=py,env,html,gitignore --name=Procfile,Makefile $1
}

# create a django app using my app template
make_django_app(){
    django-admin.py startapp --template=https://github.com/arthuralvim/django-app-template/archive/master.zip --extension=py,env,html,gitignore --name=Procfile,Makefile $1
}

function gerar_chave_ssh() {
    ssh-keygen -t rsa -b 4096 -C "afmalvim@gmail.com"
}

function git_backup(){
    git clone $1
    cd `basename ${1} .git`
    git_fetch_all_branches
    echo "=========== BRANCHES"
    git branch -a
    echo "===================="
    cd ..
}

function git_fetch_all_branches(){
    git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
    git fetch --all
    git pull --all
}

function install_oh_my_zsh() {

    # check if oh_my_zsh is installed

    # sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    if [ $# -eq 0 ]; then
        echo "true"
    else
        echo "false"
    fi

    # check if zsh is default shell

    # chsh -s /bin/zsh

    if [ $# -eq 0 ]; then
        echo "true"
    else
        echo "false"
    fi
}

function install_sublime_settings() {
    rsync -vazh --partial $DOTFILES_DIR/sublime-preferences/ $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
}

function install_python_packages() {
    sudo pip install -r PipPackages
    sudo chown $USER $HOME/.pip
}

function remove_dotfiles_settings() {
    for file in {aliases,bash_profile,bashrc,cookiecutterrc,exports,extra,functions,gitconfig,gitignore,global_gitignore,vimrc,zshrc};
    do
        if [ -f $HOME/.$file ]; then
            echo "removing $HOME/.$file"
            rm $HOME/.$file
        fi
    done
    unset file
}

function install_dotfile_settings() {
    for file in {aliases,bash_profile,bashrc,cookiecutterrc,exports,extra,functions,gitconfig,gitignore,global_gitignore,vimrc,zshrc};
    do
        if [ -L $HOME/.$file ]; then
            echo "updating $HOME/.$file"
            rm $HOME/.$file
            ln -s $DOTFILES_DIR/.$file $HOME/.$file
        else
            echo "sending $HOME/.$file"
            ln -s $DOTFILES_DIR/$file $HOME/.$file
        fi
    done
    unset file
}

function install_vim_settings() {
    vim +NeoBundleInstall +qall
}

function set_basic_permissions() {
    sudo chown $USER .pip
}


pipsi-upgrade() {
        for i in $(ls .local/venvs)
        do
                .local/venvs/$i/bin/pip install -U pip wheel
                pipsi upgrade $i
        done
}

# Header logging
e_header() {
    printf "\n$(tput setaf 7)%s$(tput sgr0)\n" "$@"
}

# Success logging
e_success() {
    printf "$(tput setaf 64)✓ %s$(tput sgr0)\n" "$@"
}

# Error logging
e_error() {
    printf "$(tput setaf 1)x %s$(tput sgr0)\n" "$@"
}

# Warning logging
e_warning() {
    printf "$(tput setaf 136)! %s$(tput sgr0)\n" "$@"
}

# Ask for confirmation before proceeding
seek_confirmation() {
    printf "\n"
    e_warning "$@"
    read -p "Continue? (y/n) " -n 1
    printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      return 0
    fi
    return 1
}

# Test whether we're in a git repo
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}

# Test whether a command exists
# $1 - cmd to test
type_exists() {
    if [ $(type -P $1) ]; then
      return 0
    fi
    return 1
}

# Test whether a Homebrew formula is already installed
# $1 - formula name (may include options)
formula_exists() {
    if $(brew list $1 >/dev/null); then
        printf "%s already installed.\n" "$1"
        return 0
    fi

    e_warning "Missing formula: $1"
    return 1
}

function play-ping {
    ansible "$@" -m ping
}

function play-setup {
    ansible "$@" -m setup
}

function play {

    if [ $# -lt 2 ]; then
        echo "Please provide an inventory and play.\nEx: play dev site -l vagrant -t super" >&2
        return 1
    fi

    local check_inventory="$(pwd)/inventories/$1/hosts"
    local check_play="$(pwd)/playbooks/$2.yml"

    echo "inventory: $check_inventory"
    echo "play: $check_play"

    if ! [ -f $check_inventory ]; then
        echo "The inventory file was not found."
        return 1
    fi

    if ! [ -f $check_play ]; then
        echo "The play file was not found."
        return 1
    fi

    local check_extra_vars="$(pwd)/extra-vars.yml"

    if [ -f $check_extra_vars ]; then
        ansible-playbook --inventory-file=$check_inventory $check_play "${@:3}" --extra-vars "@extra-vars.yml"
    else
        ansible-playbook --inventory-file=$check_inventory $check_play "${@:3}"
    fi
}

function git_remote_https_2_ssh {

    if [[ -n "$1" ]]; then
        local repo_full=$(git remote get-url "$1")
    else
        local repo_full="$(git remote get-url origin)"
    fi

    local user="$(echo $repo_full | cut -d "/" -f 4)"
    local repo="$(echo $repo_full | cut -d "/" -f 5)"

    if [[ -z "$user" ]]; then
        echo "The user was not found."
        return 1
    fi

    if [[ -z "$repo" ]]; then
        echo "The repository was not found."
        return 1
    fi

    if [[ -n "$1" ]]; then
        git remote set-url $1 git@github.com:$user/$repo
    else
        git remote set-url origin git@github.com:$user/$repo
    fi
}

function git_remote_ssh_2_https {

    if [[ -n "$1" ]]; then
        local repo_full=$(git remote get-url "$1")
    else
        local repo_full="$(git remote get-url origin)"
    fi

    local repo_full="$(echo $repo_full | cut -d ":" -f 2)"
    local user="$(echo $repo_full | cut -d "/" -f 1)"
    local repo="$(echo $repo_full | cut -d "/" -f 2)"

    if [[ -z "$user" ]]; then
        echo "The user was not found."
        return 1
    fi

    if [[ -z "$repo" ]]; then
        echo "The repository was not found."
        return 1
    fi

    if [[ -n "$1" ]]; then
        git remote set-url $1 https://github.com/$user/$repo
    else
        git remote set-url origin https://github.com/$user/$repo
    fi
}

x() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.lrz)
        b=$(basename "$1" .tar.lrz)
        lrztar -d "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.lrz)
        b=$(basename "$1" .lrz)
        lrunzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.bz2)
        b=$(basename "$1" .tar.bz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.bz2)
        b=$(basename "$1" .bz2)
        bunzip2 "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.gz)
        b=$(basename "$1" .tar.gz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.gz)
        b=$(basename "$1" .gz)
        gunzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.xz)
        b=$(basename "$1" .tar.xz)
        bsdtar Jxf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.xz)
        b=$(basename "$1" .gz)
        xz -d "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.rar)
        b=$(basename "$1" .rar)
        unrar e "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar)
        b=$(basename "$1" .tar)
        bsdtar xf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tbz2)
        b=$(basename "$1" .tbz2)
        bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tgz)
        b=$(basename "$1" .tgz)
        bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zip)
        b=$(basename "$1" .zip)
        unzip "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.Z)
        b=$(basename "$1" .Z)
        uncompress "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.7z)
        b=$(basename "$1" .7z)
        7z x "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zst)
        b=$(basename "$1" .zst)
        tar xf "$1" && return 0 ;;
      *.deb)
        b=$(basename "$1" .deb)
        ar x "$1" && return 0 ;;
      *) echo "don't know how to extract '$1'..." && return 1 ;;
    esac
    return 0
  else
    echo "'$1' is not a valid file!"
    return 1
  fi
}

whatsmyip() {
    curl https://ifconfig.co/ip
    curl https://ifconfig.co/city
}

restart_bluetooth() {

    # blueutil
    if which blueutil &> /dev/null; then
        msg_ok "blueutil"
    else
        msg_installing "blueutil installing..."
        brew install blueutil
        msg_ok "blueutil"
    fi

    blueutil -p 0
    msg_alert 'Bluetooth off!'
    blueutil -p 1
    msg 'Bluetooth on!'
}

function nrmod {
    stat -f '%A'
}

activate() {
    activate_file=$(pipenv --venv)/bin/activate
    if [ -e "$activate_file" ]; then
        . $activate_file

        # the pipenv shell normally enables these as well
        export PYTHONDONTWRITEBYTECODE=1
        export PIPENV_ACTIVE=1

        if [ -f "${VIRTUAL_ENV}/.project" ]; then
            cd $(cat "${VIRTUAL_ENV}/.project")
        fi
        return
    fi
}

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

gpg_encrypt() {
    recipient=$1
    echo -n "Type Secret: "
    read secret

    echo -n "${secret}" | gpg --encrypt --armor --trust-model always -r $recipient | pbcopy
    echo "Done. Copied to buffer."
}

gpg_search() {
    gpg --keyserver pgp.mit.edu  --search-keys $1
}

weather() {
    curl -s wttr.in/`curl -s ifconfig.co/city`
}

function dockeron {
    if [ ! "$DOCKER_MACHINE_NAME" = "" ]; then
        echo "$DOCKER_MACHINE_NAME is activated!"
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Docker host name is required! docker-machine "
    else
        eval "$(docker-machine env "${1:-default}")"
    fi
}

function dockeroff () {
  if [ "$DOCKER_MACHINE_NAME" = "" ]; then
    printf "No machine running..\n"
    return 1
  else
    eval "$(docker-machine env -u)"
  fi
}

# # systemlevel
# start() { sudo systemctl start "$1"; }
# stop() { sudo systemctl stop "$1"; }
# restart() { sudo systemctl restart "$1"; }
# status() { sudo systemctl status "$1"; }
# enabled() { sudo systemctl enable "$1"; listd; }
# disabled() { sudo systemctl disable "$1"; listd; }

# # userlevel
# ustart() { systemctl --user start "$1"; }
# ustop() { systemctl --user stop "$1"; }
# ustatus() { systemctl --user status "$1"; }
# uenabled() { systemctl --user enable "$1"; }
# udisabled() { systemctl --user disable "$1"; }

arthur() {
    msg ' ______     ______     ______   __  __     __  __     ______    '
    msg '/\  __ \   /\  == \   /\__  _\ /\ \_\ \   /\ \/\ \   /\  == \   '
    msg '\ \  __ \  \ \  __<   \/_/\ \/ \ \  __ \  \ \ \_\ \  \ \  __<   '
    msg ' \ \_\ \_\  \ \_\ \_\    \ \_\  \ \_\ \_\  \ \_____\  \ \_\ \_\ '
    msg '  \/_/\/_/   \/_/ /_/     \/_/   \/_/\/_/   \/_____/   \/_/ /_/ '
    msg ' ______     __         __   __   __     __    __    '
    msg '/\  __ \   /\ \       /\ \ / /  /\ \   /\  -./  \   '
    msg '\ \  __ \  \ \ \____  \ \ \ /   \ \ \  \ \ \-./\ \  '
    msg ' \ \_\ \_\  \ \_____\  \ \__|    \ \_\  \ \_\ \ \_\ '
    msg '  \/_/\/_/   \/_____/   \/_/      \/_/   \/_/  \/_/ '
    msg ''

}

tutu() {
    msg ' ______   __  __     ______   __  __    '
    msg '/\__  _\ /\ \/\ \   /\__  _\ /\ \/\ \   '
    msg '\/_/\ \/ \ \ \_\ \  \/_/\ \/ \ \ \_\ \  '
    msg '   \ \_\  \ \_____\    \ \_\  \ \_____\ '
    msg '    \/_/   \/_____/     \/_/   \/_____/ '
    msg ''
}



quod() {
    msg ''
    msg 'QUOD ERAT DEMONSTRANDUM'
    msg ''
    msg '                      □'
    msg ''
}

cqd() {
    quod
}

#  ______     __         __     ______     ______     ______     ______    
# /\  __ \   /\ \       /\ \   /\  __ \   /\  ___\   /\  ___\   /\  ___\   
# \ \  __ \  \ \ \____  \ \ \  \ \  __ \  \ \___  \  \ \  __\   \ \___  \  
#  \ \_\ \_\  \ \_____\  \ \_\  \ \_\ \_\  \/\_____\  \ \_____\  \/\_____\ 
#   \/_/\/_/   \/_____/   \/_/   \/_/\/_/   \/_____/   \/_____/   \/_____/ 
                                                                         

# aliases

# folders
alias home="cd $HOME"
alias work="cd $PROJECT_HOME"
alias drp="cd $HOME/Dropbox"
alias dotfiles="cd $HOME/.dotfiles"
alias dotfiles.open="subl $HOME/.dotfiles"
alias dwl="cd $HOME/Downloads"
alias doc="cd $HOME/Documents"
alias pic="cd $HOME/Pictures"
alias mov="cd $HOME/Movies"
alias mus="cd $HOME/Music"
alias ckc="cd $HOME/.cookiecutters"
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