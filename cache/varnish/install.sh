source common/functions.sh

# varnish
if which varnish &> /dev/null; then
    msg_checking "varnish"
else
    msg_install "varnish" "brew install varnish"
    brew install varnish
    msg_ok "OK"
fi

