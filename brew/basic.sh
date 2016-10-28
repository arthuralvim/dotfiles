source common/functions.sh

# homebrew

if [ "$LINUX" = "linux" ]; then
    msg_alert "no homebrew on linux!"
fi

if [ "$OSX" = "osx" ]; then

    if which brew &> /dev/null; then
        msg_checking "homebrew"
    else
        ok "Installing Homebrew!"
        ok "https://github.com/mxcl/homebrew/wiki/installation"
        msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ok "OK"
    fi

    file_to_array "brew/Tapfile"

    for tap in "${array[@]}"; do
        msg_checking "homebrew: tap ${tap}"
        brew tap "$tap"
    done

    file_to_array "brew/CaskfileBasic"

    for cask in "${array[@]}"; do
        msg_checking "homebrew: cask ${cask}"
        brew cask install --appdir="/Applications" "$cask"
    done

    brew cleanup
    brew cask cleanup

fi

