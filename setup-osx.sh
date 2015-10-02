# dotfiles setup-osx

which -s brew
if [[ $? != 0 ]] ; then
    echo "please install Homebrew"
    echo "https://github.com/mxcl/homebrew/wiki/installation"
else
    echo "brew installed!"
fi

which -s git
if [[ $? != 0 ]] ; then
    echo "installing git"
    brew install git
else
    echo "git installed!"
fi

cd $HOME

DOTFILES_DIR="$HOME/.dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "downloading dotfiles"
    git clone https://github.com/arthuralvim/dotfiles.git $DOTFILES_DIR
else
    echo "dotfiles installed!"
fi

cd $DOTFILES_DIR

for file in {aliases,bash_profile,bashrc,cookiecutterrc,exports,extra,functions,gitconfig,gitignore,global_gitignore,vimrc,zshrc};
do
	if [ -L $HOME/.$file ]; then
		echo "updating $HOME/.$file"
		rm $HOME/.$file
    	ln -s $DOTFILES_DIR/.$file $HOME/.$file
	else
		echo "sending $HOME/.$file"
    	ln -s $DOTFILES_DIR/$file $HOME/.$file
    fi
done
unset file

brew update
brew tap homebrew/bundle

brew bundle install --file=Brewfile
brew bundle install --file=Caskfile
