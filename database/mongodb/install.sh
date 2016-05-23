source common/functions.sh

# mongodb
if which mongod &> /dev/null; then
    msg_checking "mongodb"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "mongodb" "apt-get install mongodb"
        apt-get install -qq -y mongodb
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "mongodb" "brew install mongodb"
        brew install mongodb
        msg_ok "OK"
    fi
fi

# sudo mkdir -p /data/db
# ls -ld /data/db/
# sudo chmod 0755 /data/db
# sudo chown mongod:mongod /data/db
