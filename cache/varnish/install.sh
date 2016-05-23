source common/functions.sh

# varnish
if which varnishd &> /dev/null; then
    msg_checking "varnish"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "varnish" "apt-get install varnish"
        apt-get install -qq -y varnish
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "varnish" "brew install varnish"
        brew install varnish
        msg_ok "OK"
    fi
fi
