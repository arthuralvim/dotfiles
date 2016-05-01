
# mongodb
if which mongod &> /dev/null; then
    msg_checking "mongodb"
else
    msg_install "mongodb" "brew install mongodb"
    brew install mongodb --with-openssl
    msg_ok "OK"
fi

ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
sudo mkdir -p /data/db
ls -ld /data/db/
sudo chmod 0755 /data/db
sudo chown mongod:mongod /data/db
