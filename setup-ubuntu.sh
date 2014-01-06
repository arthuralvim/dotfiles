sudo aptitude install -y git-core
cd ~
DEV_DIR="`pwd`/work"
if [ ! -d "$DEV_DIR" ]; then
	mkdir -p $DEV_DIR
fi
DOTFILES_DIR="$DEV_DIR/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
	git clone git@github.com:arthuralvim/dotfiles.git $DOTFILES_DIR
fi
cd $DOTFILES_DIR
make setup.ubuntu
