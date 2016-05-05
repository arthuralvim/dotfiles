source common/functions.sh

# elasticsearch
if which elasticsearch &> /dev/null; then
    msg_checking "elasticsearch"
else
    msg_install "elasticsearch" "brew install elasticsearch"
    brew install elasticsearch
    msg_ok "OK"
fi
