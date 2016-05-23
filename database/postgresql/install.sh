source common/functions.sh

# postgresql
if which psql &> /dev/null; then
    msg_checking "postgresql"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "postgresql" "apt-get install postgresql"
        apt-get install -qq -y postgresql postgresql-contrib pgadmin3
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "postgresql" "brew install postgresql"
        brew install pgbadger
        brew install pgbouncer
        brew install pgcli
        brew install pgformatter
        brew install postgis
        brew install postgresql
        msg_ok "OK"
    fi
fi
