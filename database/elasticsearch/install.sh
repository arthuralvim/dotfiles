source common/functions.sh

# elasticsearch
if which elasticsearch &> /dev/null; then
    msg_checking "elasticsearch"
else

    if [ "$LINUX" = "linux" ]; then
        msg_install "elasticsearch" "apt-get install elasticsearch"
        apt-get install software-properties-common
        add-apt-repository -y ppa:webupd8team/java
        apt-get update
        apt-get install -qq -y oracle-java8-installer
        wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.3/elasticsearch-2.3.3.deb
        dpkg -i elasticsearch-2.3.3.deb
        msg_ok "OK"
    fi

    if [ "$OSX" = "osx" ]; then
        msg_install "elasticsearch" "brew install elasticsearch"
        brew install elasticsearch
        msg_ok "OK"
    fi
fi
