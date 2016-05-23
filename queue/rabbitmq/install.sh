source common/functions.sh

# rabbitmq
if which rabbitmq-server &> /dev/null; then
    msg_checking "rabbitmq"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "rabbitmq-server" "apt-get install rabbitmq-server"
        apt-get install -qq -y rabbitmq-server
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "rabbitmq" "brew install rabbitmq"
        brew install rabbitmq
        msg_ok "OK"
    fi
fi
