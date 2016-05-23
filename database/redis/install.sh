source common/functions.sh

# redis
if which redis-server &> /dev/null; then
    msg_checking "redis"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "redis-server" "apt-get install redis-server"
        apt-get install -qq -y redis-server
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "redis" "brew install redis"
        brew install redis
        msg_ok "OK"
    fi
fi
