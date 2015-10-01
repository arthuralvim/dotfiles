# dotfiles setup-osx

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

for file in $DOTFILES_DIR/.{aliases, bash_profile, bashrc, cookiecutterrc, exports, extra, functions, gitconfig, gitignore, global_gitignore, vimrc, zshrc}
do
    echo "pwd/.$file"
    # ln -sf "pwd/.$file" "$HOME_DIR/.$file"
done

# zsh and ohmyzsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

sudo chown $USER .pip

# install brew packages

brew tap homebrew/bundle
brew bundle install --file=Brewfile
brew bundle install --file=Caskfile

# install vim settings

cd $HOME_DIR
vim +NeoBundleInstall +qall

# install sublime settings

rsync -vazh --partial $DOTFILES_DIR/sublime-preferences/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/


