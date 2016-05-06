source common/functions.sh

if which java &> /dev/null; then
    msg_checking "java"
else
    msg_install "java"
    brew cask install java
    echo "OK"
fi
