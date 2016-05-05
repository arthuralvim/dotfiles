source common/functions.sh

# zeromq
if which zeromq &> /dev/null; then
    msg_checking "zeromq"
else
    msg_install "zeromq" "brew install zeromq"
    brew install zeromq
    msg_ok "OK"
fi
