source common/functions.sh

if which python &> /dev/null; then
    msg_checking "python"
else
    msg_install "python" "brew install python"
    brew install python
    pip install --upgrade pip setuptools
    brew install python3
    pip3 install --upgrade pip setuptools wheel
    brew install pypy
    pip_pypy install --upgrade pip
    brew install pypy3
    pip_pypy3 install --upgrade pip
    msg_ok "python"
fi

file_to_array "development/python/PipPackages"

for package in "${array[@]}"; do
    msg_checking "python: pip install ${package}"
    pip install "$package"
done
