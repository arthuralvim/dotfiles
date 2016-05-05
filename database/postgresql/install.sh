source common/functions.sh

# postgresql
if which psql &> /dev/null; then
    msg_checking "postgresql"
else
    msg_install "postgresql" "brew install postgresql"
    brew install pgbadger
    brew install pgbouncer
    brew install pgcli
    brew install pgformatter
    brew install postgis
    brew install postgresql
    msg_ok "OK"
fi
