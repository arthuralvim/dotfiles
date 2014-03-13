
setup.mac: git.config ohmyzsh symlinks heroku python opencv brew

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
	@brew bundle Brewfile
	@brew linkapps
	@sudo chown -R $(whoami) /usr/local
	@rm -f ~/.zcompdump; compinit
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
	@echo ">>>>>>>>>>>>> OH MY ZSH FINISHED <<<<<<<<<<<<<<<"

rvm:
	@echo ">>>>>>>>>>>>> RVM <<<<<<<<<<<<<<<"
	@if [ ! -f ~/.rvm/bin/rvm ]; then sudo curl -L https://get.rvm.io | bash -s stable --ruby; fi
	@if [ -f ~/.rvm/bin/rvm ]; then echo 'RVM already installed. Skipping...' ; fi
	@echo ">>>>>>>>> RVM FINISHED <<<<<<<<<<"
	@echo

python:
	@echo ">>>>>>>>>>>>> PYTHON <<<<<<<<<<<<<<<"
	@brew install python --framework --universal --with-brewed-openssl
	@brew install python3 --framework --universal --with-brewed-openssl
	@brew linkapps
	@sudo pip install -r python.packages
	@sudo pip3 install -r python.base.packages
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
	@curl https://npmjs.org/install.sh | sh
	@echo ">>>>>>>>> NODE JS FINISHED <<<<<<<<<<"
	@echo

sublime.prefs:
	@echo ">>>>>>>>>>>>> SUBLIME TEXT PREFERENCES <<<<<<<<<<<<<<<"
	@ln -sf `pwd`/sublime-preferences/Default (OSX).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default (OSX).sublime-keymap
	@ln -sf `pwd`/sublime-preferences/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
	@ln -sf `pwd`/sublime-preferences/Package Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package Control.sublime-settings
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
	@sudo pip install numpy
	@brew install homebrew/science/opencv
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

osx.remove.apps:
	# removing apps I dont use.
	@echo ">>>>>>>>>>>>> OSX REMOVE APPS <<<<<<<<<<<<<<<"
	@sudo rm -Rf Chess.app
	@sudo rm -Rf FaceTime.app
	@sudo rm -Rf Game\ Center.app
	@sudo rm -Rf Mail.app
	@sudo rm -Rf Maps.app
	@sudo rm -Rf Messages.app
	@sudo rm -Rf Notes.app
	@sudo rm -Rf Photo\ Booth.app
	@sudo rm -Rf Reminders.app
	@sudo rm -Rf Stickies.app
	@echo ">>>>>>>>>>>>> OSX REMOVE APPS FINISHED <<<<<<<<<<<<<<<"

symlinks:
	@mkdir -p ~/.virtualenvs
	@rm -rf ~/.vim
	@ln -sf `pwd`/.zshrc ~/.zshrc
	@ln -sf `pwd`/.exports ~/.exports
	@ln -sf `pwd`/.aliases ~/.aliases
	@ln -sf `pwd`/.functions ~/.functions
	@ln -sf `pwd`/.extra ~/.extra
	@ln -sf `pwd`/vim/.vim ~/.vim
	@ln -sf `pwd`/vim/.vimrc ~/.vimrc
	@git submodule update --init
	@mkdir -p `pwd`/vim/.vim/bundle
	@ln -sf `pwd`/vim/.vim/thirdparty/vundle `pwd`/vim/.vim/bundle/vundle
	@ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
	@ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/sublime
	sudo chown arthuralvim .pip
	sudo ln -s /usr/local/Cellar/python/2.7.6/Frameworks/Python.framework/Versions/Current

install.prefs:
	@echo ">>>>>>>>>>>>> REMOVING LAST PREFERENCES <<<<<<<<<<<<<<<"
	@echo ">>>>>>>>>>>>> SUBLIME TEXT SETTINGS <<<<<<<<<<<<<<<"
	@cp `pwd`/sublime-preferences/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
	@cp `pwd`/sublime-preferences/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
	@cp `pwd`/sublime-preferences/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
	@cp `pwd`/sublime-preferences/sublime_jedi.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime_jedi.sublime-settings
	@cp `pwd`/sublime-preferences/SublimeLinter.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/SublimeLinter.sublime-settings
	@cp `pwd`/sublime-preferences/PlainTasks.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/PlainTasks.sublime-settings
	@echo ">>>>>>>>>>>>> SUBLIME TEXT SNIPPETS <<<<<<<<<<<<<<<"
	@ln -sf `pwd`/sublime-preferences/codutf.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/codutf.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/console.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/console.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/debug.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/debug.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/debugjs.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/debugjs.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/debugpy.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/debugpy.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/include.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/include.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/route.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/route.sublime-snippet
	@ln -sf `pwd`/sublime-preferences/ugettext.sublime-snippet ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/ugettext.sublime-snippet
	@echo ">>>>>>>>>>>>> SUBLIME TEXT BUILD SYSTEMS <<<<<<<<<<<<<<<"
	@ln -sf `pwd`/sublime-preferences/Bibtex.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Bibtex.sublime-build
	@ln -sf `pwd`/sublime-preferences/chrome-preview.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/chrome-preview.sublime-build
	@ln -sf `pwd`/sublime-preferences/CleanTexFiles.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/CleanTexFiles.sublime-build
	@ln -sf `pwd`/sublime-preferences/firefox-preview.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/firefox-preview.sublime-build
	@ln -sf `pwd`/sublime-preferences/PDFLatex.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/PDFLatex.sublime-build
	@ln -sf `pwd`/sublime-preferences/RunBuild.py ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/RunBuild.py
	@ln -sf `pwd`/sublime-preferences/RunBuildAll.py ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/RunBuildAll.py
	@ln -sf `pwd`/sublime-preferences/safari-preview.sublime-build ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/safari-preview.sublime-build
	@echo ">>>>>>>>>>>>> SUBLIME TEXT SPELL/DICTS <<<<<<<<<<<<<<<"
	@ln -sf `pwd`/sublime-preferences/Portuguese\ \(Brazilian\).aff ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Portuguese\ \(Brazilian\).aff
	@ln -sf `pwd`/sublime-preferences/Portuguese\ \(Brazilian\).dic ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Portuguese\ \(Brazilian\).dic
	@ln -sf `pwd`/sublime-preferences/Portuguese\ \(Brazilian\).txt ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Portuguese\ \(Brazilian\).txt
	# @echo ">>>>>>>>>>>>> ZSH <<<<<<<<<<<<<<<"
	# @ln -sf `pwd`/.zshrc ~/.zshrc
	# @ln -sf `pwd`/.exports ~/.exports
	# @ln -sf `pwd`/.aliases ~/.aliases
	# @ln -sf `pwd`/.functions ~/.functions
	# @ln -sf `pwd`/.extra ~/.extra
