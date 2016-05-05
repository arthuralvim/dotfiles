source common/functions.sh

# memcached
if which memcached &> /dev/null; then
    msg_checking "memcached"
else
    msg_install "memcached" "brew install memcached"
    brew install libmemcached
    brew install memcached
    brew install memcache-top
    msg_ok "OK"
fi
