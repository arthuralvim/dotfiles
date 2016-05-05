source common/functions.sh

# couchdb
if which couchdb &> /dev/null; then
    msg_checking "couchdb"
else
    msg_install "couchdb" "brew install couchdb"
    brew install couchdb
    msg_ok "OK"
fi
