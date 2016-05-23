source common/functions.sh

# couchdb
if which couchdb &> /dev/null; then
    msg_checking "couchdb"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "couchdb" "apt-get install couchdb"
        apt-get install -qq -y couchdb
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "couchdb" "brew install couchdb"
        brew install couchdb
        msg_ok "OK"
    fi
fi
