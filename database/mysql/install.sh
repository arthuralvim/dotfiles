source common/functions.sh

# mysql
if which mysqld &> /dev/null; then
    msg_checking "mysql"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "mysql-server" "apt-get install mysql-server"
        apt-get install -qq -y mysql-server
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "mysql" "brew install mysql"
        brew install mysql
        msg_ok "OK"
    fi
fi
