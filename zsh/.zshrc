# zsh configuration file

ZSH=$HOME/.oh-my-zsh

unsetopt nomatch

ZSH_THEME="alvim"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
plugins=(bower common-aliases copyzshell django extract git git-extras history httpie sublime web-search osx)

# zsh completions

export HOMESHICK_DIR=/usr/local/opt/homeshick
source "$HOMESHICK_DIR/homeshick.sh"

fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# added by travis gem
[ -f /Users/arthuralvim/.travis/travis.sh ] && source /Users/arthuralvim/.travis/travis.sh

# added by pipsi (https://github.com/mitsuhiko/pipsi)
export PATH="/Users/arthuralvim/.local/bin:$PATH"

# export PIPENV_IGNORE_VIRTUALENVS=1

# export PYSPARK_DRIVER_PYTHON=jupyter
# export PYSPARK_DRIVER_PYTHON_OPTS='notebook'
# export PYSPARK_SUBMIT_ARGS="--master local[2] pyspark-shell"
# export PYSPARK_PYTHON=/Users/arthuralvim/.pyenv/versions/curso_extensao_machine_learning/bin/python
# export PIP_REQUIRE_VIRTUALENV=true

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

alias a=activate
alias d=deactivate
