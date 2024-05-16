# brew install pyenv pyenv-virtualenv openssl readline sqlite3 xz zlib
# pyenv install 3.11.9
# pyenv install 3.12.3
# pyenv global 3.12.3
# gpip install pipx
# pipx install awscli black httpie ipython mypy poetry pre-commit yt-dlp pycodestyle flake8

function file_to_array() {
    array=()
    while IFS= read -r line
    do
        array+=("$line")
    done < "$1"
}

file_to_array "PipXPackages"

for package in "${array[@]}"; do
    msg_checking "python: pipx install ${package}"
    pipx install "$package"
done