source common/functions.sh

# nginx
if which nginx &> /dev/null; then
    msg_checking "nginx"
else
    msg_install "nginx" "brew install nginx"
    brew install nginx
    msg_ok "OK"
fi

# haproxy
if which haproxy &> /dev/null; then
    msg_checking "haproxy"
else
    msg_install "haproxy" "brew install haproxy"
    brew install haproxy
    msg_ok "OK"
fi

# uwsgi
if which uwsgi &> /dev/null; then
    msg_checking "uwsgi"
else
    msg_install "uwsgi" "brew install uwsgi"
    brew install uwsgi
    msg_ok "OK"
fi
