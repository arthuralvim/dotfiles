source common/functions.sh

# homebrew

if which brew &> /dev/null; then
    msg_checking "homebrew"
else
    msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ok "OK"
fi

file_to_array "brew/Tapfile"

for tap in "${array[@]}"; do
    msg_checking "homebrew: tap ${tap}"
    brew tap "$tap"
done

file_to_array "brew/Brewfile"

for package in "${array[@]}"; do
    msg_checking "homebrew: package ${package}"
    brew install "$package"
done

file_to_array "brew/Caskfile"

for cask in "${array[@]}"; do
    msg_checking "homebrew: cask ${cask}"
    brew cask install --appdir="/Applications" "$cask"
done

brew cleanup
brew cask cleanup

