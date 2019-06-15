
CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix sqlite3)/include" pyenv install miniconda-3.18.3
CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix sqlite3)/include" pyenv install 2.7.15
CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix sqlite3)/include" pyenv install 3.6.0
CPPFLAGS="-I$(brew --prefix zlib)/include -I$(brew --prefix sqlite3)/include" pyenv install 3.6.8

pyenv global 3.6.0

pip install pipx

file_to_array "PipXPackages"

for package in "${array[@]}"; do
    msg_checking "python: pipx install ${package}"
    pipx install "$package"
done