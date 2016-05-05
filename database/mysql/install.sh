source common/functions.sh

# mysql
if which mysqld &> /dev/null; then
    msg_checking "mysql"
else
    msg_install "mysql" "brew install mysql"
    brew install mysql
    msg_ok "OK"
fi
