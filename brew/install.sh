# homebrew

if which brew &> /dev/null; then
    msg_checking "homebrew"
else
    ok "Installing Homebrew!"
    ok "https://github.com/mxcl/homebrew/wiki/installation"
    msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ok "OK"
fi

file_to_array "Brewfile"

for beer in "${array[@]}"; do
    msg_checking "homebrew: brew ${beer}"
    brew install "$beer"
done

file_to_array "Caskfile"

for cask in "${array[@]}"; do
    msg_checking "homebrew: cask ${cask}"
    brew cask install "$cask"
done

brew cleanup -s
rm -rf $(brew --cache)
