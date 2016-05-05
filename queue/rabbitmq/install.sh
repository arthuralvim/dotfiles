source common/functions.sh

# rabbitmq
if which rabbitmq-server &> /dev/null; then
    msg_checking "rabbitmq"
else
    msg_install "rabbitmq" "brew install rabbitmq"
    brew install rabbitmq
    msg_ok "OK"
fi
