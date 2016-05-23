source common/functions.sh

# ubuntu
if [ "$OSX" = "osx" ]; then
    msg_alert "Ubuntu packages can't be installed on OSX!"
fi

if [ "$LINUX" = "linux" ]; then

    apt-get update

    msg_checking "Ubuntu Packages"

    file_to_array "ubuntu/Packagesfile"

    for package in "${array[@]}"; do
        msg_checking "apt-get install ${package}"
        apt-get install -qq -y "$package"
    done

    file_to_array "ubuntu/PackagesDepfile"

    for dep in "${array[@]}"; do
        msg_checking "apt-get build-dep ${dep}"
        apt-get build-dep "$dep"
    done

fi
