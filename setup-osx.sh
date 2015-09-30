# dotfiles setup-mac

# check if brew is installed

which -s brew
if [[ $? != 0 ]] ; then
    echo "please install Homebrew"
    echo "https://github.com/mxcl/homebrew/wiki/installation"
else
    brew update
fi

# check if git is installed

which -s git || brew install git

HOME_DIR="~"
cd HOME_DIR

DOTFILES_DIR="$HOME_DIR/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
	git clone git@github.com:arthuralvim/dotfiles.git $DOTFILES_DIR
fi

cd $DOTFILES_DIR

# install brew packages

brew tap homebrew/bundle
brew bundle Brewfile
brew bundle Caskfile
