source common/functions.sh

# riak
if which riak &> /dev/null; then
    msg_checking "riak"
else
    msg_install "riak" "brew install riak"
    brew install riak
    msg_ok "OK"
fi
