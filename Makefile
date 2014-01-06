
setup.mac: osx git git.config python brew memcached rvm opencv symlinks

setup.ubuntu: apt git.ubuntu git.config python-ubuntu rvm nodejs symlinks

apt:
	@echo ">>>>>>>>>>>>> UBUNTU PACKAGES <<<<<<<<<<<<<<<"
	@sudo aptitude update
	@sudo aptitude safe-upgrade -y
	@cat ubuntu.packages | xargs sudo aptitude install -y
	@echo ">>>>>>>>>>>>> UBUNTU PACKAGES FINISHED <<<<<<<<<<<<<<<"

apt.media:
	@echo ">>>>>>>>>>>>> UBUNTU MEDIA <<<<<<<<<<<<<<<"
	@sudo aptitude update
	@sudo aptitude safe-upgrade -y
	@cat ubuntu.media.packages | xargs sudo aptitude install -y
	@sudo add-apt-repository ppa:fossfreedom/rhythmbox-plugins && sudo apt-get update
	@sudo apt-get install rhythmbox-plugin-complete
	@sudo add-apt-repository ppa:jd-team/jdownloader && sudo apt-get update
	@sudo apt-get install -y jdownloader
	@echo ">>>>>>>>>>>>> UBUNTU MEDIA FINISHED <<<<<<<<<<<<<<<"

memcached:
	@echo ">>>>>>>>>>>>> MEMCACHED <<<<<<<<<<<<<<<"
	@brew update
	@-brew uninstall -y libev
	@-brew install libevent
	@brew link libevent
	@-brew install memcached
	@-brew install libmemcached
	@-brew upgrade memcached
	@-brew upgrade libmemcached
	@brew unlink libevent
	@brew linkapps
	@echo ">>>>>>>>> MEMCACHED FINISHED <<<<<<<<<<"
	@echo

brew:
	@echo ">>>>>>>>>>>>> BREW <<<<<<<<<<<<<<<"
	@if [ ! -f /usr/local/brew ]; @ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
	@if [ -f /usr/local/brew ]; then echo 'Homebrew already installed. Skipping...' ; fi
	@brew update
	@brew upgrade
	@echo ">>>>>>>>> INSTALLING BREW FORMULAS  <<<<<<<<<<"
	@brew bundle Brewfile
	@brew linkapps
	@echo ">>>>>>>>> BREW FINISHED <<<<<<<<<<"
	@echo

git:
	@echo ">>>>>>>>>>>>> GIT <<<<<<<<<<<<<<<"
	@brew install git
	@echo ">>>>>>>>> GIT FINISHED <<<<<<<<<<":

git.ubuntu:
	@echo ">>>>>>>>>>>>> GIT <<<<<<<<<<<<<<<"
	@sudo aptitude install git -y
	@echo ">>>>>>>>> GIT FINISHED <<<<<<<<<<":

git.config:
	@echo ">>>>>>>>>>>>> GIT CONFIG <<<<<<<<<<<<<<<"
	@git config --global user.name "Arthur Alvim"
	@git config --global user.email "afmalvim@gmail.com"
	@git config --global core.editor "subl -w"
	@git config --global color.ui true
	@echo ">>>>>>>>> GIT CONFIG FINISHED <<<<<<<<<<":

ohmyzsh:
	@echo ">>>>>>>>>>>>> OH MY ZSH <<<<<<<<<<<<<<<"
	@curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
	@chsh -s /bin/zsh
	@echo ">>>>>>>>>>>>> OH MY ZSH FINISHED <<<<<<<<<<<<<<<"

rvm:
	@echo ">>>>>>>>>>>>> RVM <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.rvm/bin/rvm ]; then curl -L https://get.rvm.io | bash -s stable --ruby; fi
	@if [ -f ~/.rvm/bin/rvm ]; then echo 'RVM already installed. Skipping...' ; fi
	@echo ">>>>>>>>> RVM FINISHED <<<<<<<<<<"
	@echo

python:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@brew install python --framework --universal --with-brewed-openssl
	@brew install python3 --framework --universal --with-brewed-openssl
	@brew linkapps
	@sudo pip install --upgrade pip
	@sudo pip install -r python.packages
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"
	@echo

python.ubuntu:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@sudo aptitude install python2.7-dev python-pip -y
	@sudo pip install --upgrade pip
	@sudo pip install -r python.packages
	@echo ">>>>>>>>> PYTHON FINISHED <<<<<<<<<<"

nodejs:
	@echo ">>>>>>>>>>>>> NODE JS <<<<<<<<<<<<<<<"
	@sudo apt-get install python-software-properties python g++ make -y
	@sudo add-apt-repository ppa:chris-lea/node.js && sudo apt-get update
	@sudo apt-get install nodejs -y
	@echo ">>>>>>>>> NODE JS FINISHED <<<<<<<<<<"
	@echo

nodepm:
	@echo ">>>>>>>>>>>>> NODE JS <<<<<<<<<<<<<<<"
	@curl http://npmjs.org/install.sh | sh
	@echo ">>>>>>>>> NODE JS FINISHED <<<<<<<<<<"
	@echo

sublime.prefs:
	@echo ">>>>>>>>>>>>> SUBLIME TEXT PREFERENCES <<<<<<<<<<<<<<<"
	@ln -sf `pwd`/sublime-preferences/Default (OSX).sublime-keymap ~/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap
	@ln -sf `pwd`/sublime-preferences/Preferences.sublime-settings ~/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings
	@ln -sf `pwd`/sublime-preferences/Package Control.sublime-settings ~/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings
	@echo ">>>>>>>>>>>>> SUBLIME TEXT FINISHED <<<<<<<<<<<<<<<"

sublime.prefs.ubuntu:
	@echo ">>>>>>>>>>>>> SUBLIME TEXT PREFERENCES <<<<<<<<<<<<<<<"
	@echo "TODO"
	@echo ">>>>>>>>>>>>> SUBLIME TEXT FINISHED <<<<<<<<<<<<<<<"

sublime.ubuntu:
	@echo ">>>>>>>>>>>>> SUBLIME TEXT <<<<<<<<<<<<<<<"
	@sudo add-apt-repository ppa:webupd8team/sublime-text-3
	@sudo apt-get update
	@sudo apt-get install sublime-text-installer -y
	@echo ">>>>>>>>>>>>> SUBLIME TEXT FINISHED <<<<<<<<<<<<<<<"
	@echo

google.chrome:
	@echo ">>>>>>>>>>>>> GOOGLE CHROME TEXT <<<<<<<<<<<<<<<"
	@curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
	@hdiutil attach googlechrome.dmg && cd /Volumes/Google\ Chrome && cp -R Google\ Chrome.app /Applications && hdiutil detach /Volumes/Google\ Chrome
	@rm googlechrome.dmg
	@echo ">>>>>>>>>>>>> GOOGLE CHROME FINISHED <<<<<<<<<<<<<<<"
	@echo

google.chrome.ubuntu:
	@echo ">>>>>>>>>>>>> GOOGLE CHROME <<<<<<<<<<<<<<<"
	# @wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	# @sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && sudo apt-get update
	# @sudo apt-get install google-chrome-stable
	# or
	@wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	@sudo dpkg -i google-chrome*.deb
	@echo ">>>>>>>>>>>>> GOOGLE CHROME FINISHED <<<<<<<<<<<<<<<"
	@echo


heroku:
	@echo ">>>>>>>>>>>>> HEROKU <<<<<<<<<<<<<<<"
	@brew install heroku-toolbelt
	@heroku plugins:install git://github.com/ddollar/heroku-config.git
	@echo ">>>>>>>>>>>>> HEROKU FINISHED <<<<<<<<<<<<<<<"
	@echo

heroku.ubuntu:
	@echo ">>>>>>>>>>>>> HEROKU <<<<<<<<<<<<<<<"
	@wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
	@heroku plugins:install git://github.com/ddollar/heroku-config.git
	@echo ">>>>>>>>>>>>> HEROKU FINISHED <<<<<<<<<<<<<<<"
	@echo

skype.ubuntu:
	@echo ">>>>>>>>>>>>> SKYPE <<<<<<<<<<<<<<<"
	@sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ saucy partner' >> /etc/apt/sources.list.d/canonical_partner.list" && sudo apt-get update
	@sudo apt-get install skype
	@echo ">>>>>>>>>>>>> SKYPE FINISHED <<<<<<<<<<<<<<<"

java.ppa.ubuntu:
	@echo ">>>>>>>>>>>>> JAVA <<<<<<<<<<<<<<<"
	@sudo add-apt-repository ppa:webupd8team/java && sudo apt-get update
	@sudo apt-get install oracle-jdk7-installer
	@echo ">>>>>>>>>>>>> JAVA FINISHED <<<<<<<<<<<<<<<"

java.ubuntu:
	@echo ">>>>>>>>>>>>> JAVA <<<<<<<<<<<<<<<"
	@sudo apt-get install openjdk-7-jre icedtea-7-plugin
	@echo ">>>>>>>>>>>>> JAVA FINISHED <<<<<<<<<<<<<<<"

opencv:
	@echo ">>>>>>>>>>>>> OpenCV <<<<<<<<<<<<<<<"
	@brew install opencv
	@brew linkapps
	@echo ">>>>>>>>> OpenCV FINISHED <<<<<<<<<<"
	@echo

root.password:
	@echo ">>>>>>>>>>>>> PASSWORD <<<<<<<<<<<<<<<"
	@sudo passwd root
	@echo ">>>>>>>>>>>>> PASSWORD FINISHED <<<<<<<<<<<<<<<"

grub:
	@echo ">>>>>>>>>>>>> GRUB <<<<<<<<<<<<<<<"
	@sudo sed -i 's/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=640x480/g' /etc/default/grub && sudo update-grub
	@echo ">>>>>>>>>>>>> GRUB FINISHED <<<<<<<<<<<<<<<"

osx:
	@echo ">>>>>>>>>>>>> OSX <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.has_sourced_osx ]; then source `pwd`/.osx; fi
	@if [ -f ~/.has_sourced_osx ]; then echo 'Already configured MAC OS X. Skipping...' ; fi
	@touch ~/.has_sourced_osx
	@echo ">>>>>>>>> OSX FINISHED <<<<<<<<<<"
	@echo

symlinks:
	@mkdir -p ~/.virtualenvs
	@rm -rf ~/.vim
	@ln -sf `pwd`/.zshrc ~/.zshrc
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@git submodule update --init
	@mkdir -p `pwd`/vim/.vim/bundle
	@ln -sf `pwd`/vim/.vim/thirdparty/vundle `pwd`/vim/.vim/bundle/vundle
	@ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
	@ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
