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
        brew cask install mongodb
        brew cask install mongodb-compass
        brew cask install robomongo
        msg_ok "OK"
    fi
fi
