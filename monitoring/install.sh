source common/functions.sh

# riemann
if which riemann &> /dev/null; then
    msg_checking "riemann"
else
    msg_install "riemann" "brew install riemann"
    brew install riemann
    msg_ok "OK"
fi

# monit
if which monit &> /dev/null; then
    msg_checking "monit"
else
    msg_install "monit" "brew install monit"
    brew install monit
    msg_ok "OK"
fi
