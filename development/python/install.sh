source common/functions.sh

msg_install "pyenv" "brew install pyenv"

if ! which pyenv > /dev/null; then brew install pyenv; fi
if ! which pyenv-virtualenv > /dev/null; then brew install pyenv-virtualenv; fi
if ! which pyenv-virtualenvwrapper > /dev/null; then brew install pyenv-virtualenvwrapper; fi

msg_ok "pyenv"

msg_alert "Se tiver com problemas execute: xcode-select --install"

pyenv install 3.6.0
pyenv install 2.7.13
pyenv install miniconda-3.18.3

pyenv virtualenv 3.6.0 jupyter
pyenv virtualenv 2.7.13 ipython
pyenv virtualenv 3.6.0 tools3
pyenv virtualenv 2.7.13 tools2


pyenv activate jupyter
pip install jupyter
python -m ipykernel install --user
pyenv deactivate

pyenv activate ipython
pip install ipykernel
python -m ipykernel install --user
pyenv deactivate

pyenv activate tools3
pip install youtube-dl gnucash-to-beancount rows
pyenv deactivate

pyenv activate tools2
pip install rename s3cmd fabric mercurial
pyenv deactivate

pyenv global 3.6.0 2.7.13 jupyter3 ipython2 tools3 tools2

ipython profile create

file_to_array "development/python/PipPackages"

for package in "${array[@]}"; do
    msg_checking "python: pip install ${package}"
    pip install "$package"
done
