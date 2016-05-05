source common/functions.sh

# redis
if which redis-server &> /dev/null; then
    msg_checking "redis"
else
    msg_install "redis" "brew install redis"
    brew install redis
    msg_ok "OK"
fi
