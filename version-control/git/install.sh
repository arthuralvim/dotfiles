source common/functions.sh

# git
if which git &> /dev/null; then
    msg_checking "git"
else
    msg_install "git" "brew install git"
    brew install git
    brew install git-extras
    brew install git-cal
    brew install git-flow
    brew install meld
    msg_ok "OK"
fi
