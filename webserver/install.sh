source common/functions.sh



# nginx
if which nginx &> /dev/null; then
    msg_checking "nginx"
else
    if [ "$LINUX" = "linux" ]; then
        msg_install "nginx" "apt-get install nginx"
        apt-get install -qq -y nginx
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "nginx" "brew install nginx"
        brew install nginx
        msg_ok "OK"
    fi
fi

# haproxy
if which haproxy &> /dev/null; then
    msg_checking "haproxy"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "haproxy" "apt-get install haproxy"
        apt-get install -qq -y haproxy
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "haproxy" "brew install haproxy"
        brew install haproxy
        msg_ok "OK"
    fi
fi

# uwsgi
if which uwsgi &> /dev/null; then
    msg_checking "uwsgi"
else
    if [ "$LINUX" = "linux" ]; then
        msg_install "uwsgi" "apt-get install uwsgi"
        apt-get install -qq -y uwsgi
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "uwsgi" "brew install uwsgi"
        brew install uwsgi
        msg_ok "OK"
    fi
fi
