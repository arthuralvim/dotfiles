source common/functions.sh

# memcached
if which memcached &> /dev/null; then
    msg_checking "memcached"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "memcached" "apt-get install memcached"
        apt-get install -qq -y memcached
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "memcached" "brew install memcached"
        brew install libmemcached
        brew install memcached
        brew install memcache-top
        msg_ok "OK"
    fi
fi
