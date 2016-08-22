source common/functions.sh

if which python &> /dev/null; then
    msg_checking "python"
else
    msg_install "python" "brew install python"
    brew install python
    brew install python3
    brew install pypy
    brew install pypy3
    msg_ok "python"
fi

file_to_array "development/python/PipPackages"

for package in "${array[@]}"; do
    msg_checking "python: pip install ${package}"
    pip install "$package"
done
