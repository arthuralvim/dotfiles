Welcome to the Arthur's dotfiles wiki!

## Introduction

These are my dotfiles + basic configuration files. Here I describe how I set my developer environment on my MacBook (or an Ubuntu machine). The steps below were tested on macOS Sierra (still WIP for Ubuntu 16.10).


## First Steps

- Get your credentials and login into AppStore .
- Install XCode (AppStore) and accept license. ```xcode-select --install and sudo xcodebuild -license accept``
- Install Git.
- Install Brew. ```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```


## Installation


```bash
$ git clone https://github.com/arthuralvim/dotfiles.git && cd .dotfiles
```

- [ ] Basic Installation: `sh basic.sh`
- [ ] Developer Installation: `sh dev.sh`
- [ ] Full Installation: `sh all.sh`

## Checklist

- [ ] OSX:
    - [ ] [Deactivate SIP (System Integrity Protection)](http://totalfinder.binaryage.com/system-integrity-protection)
     You must boot into the Recovery OS. You do this by restarting your machine, and holding COMMAND + R until the Apple logo appears. Then select Terminal from the Utilities menu. Run ```csrutil enable --without debug```.

- [ ] Fuzzy Search (answer y to all)

- [ ] Set up Dropbox

- [ ] Copy ssh keys

- [ ] Set personal shortcuts

- [ ] Trackpad Settings
    - [ ] Tap to click

- [ ] Configure Menumeters
    - [ ] Show CPU (Graph and show average for multiple processors)
    - [ ] Show Memory (Used/Free Totals)
    - [ ] Show Network (Throughput)

- [ ] Configure Itsycal or Day-O with this regex `E d MMMM Y - H:mm`.

- [ ] Download and add the fonts below
	- [ ] Menlo
    - [ ] Inconsolata
	- [ ] Source Code Pro

- [ ] Configure Sublime Text
	- [ ] Install Package Control
	- [ ] Install Settings
	- [ ] Install Packages

- [ ] Dock
    - [ ] Organize Apps
        - [ ] Finder
        - [ ] Google Chrome
        - [ ] Sublime Text 3
        - [ ] Slack
        - [ ] iTerm 2
        - [ ] Spotify
        - [ ] Photos
        - [ ] VLC
        - [ ] App Store
        - [ ] LauchPad
        - [ ] Siri
    - [ ] Automatically hide and show (alt-option + command + d)
    - [ ] Lock it with Deeper

- [ ] Add key licenses for the software below:
    - [ ] TotalFinder
    - [ ] Alfred 2
    - [ ] Hazel
    - [ ] Sublime Text

## Acknowledgement

I have mainly rewrote [Davidson Fellipe](https://github.com/davidsonfellipe)'s [dotfile](https://github.com/davidsonfellipe/dotfiles)
but was inspired by all theses guys:

* [alrra](https://github.com/alrra/dotfiles/)
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
* [necolas](https://github.com/necolas/dotfiles)
* [nicknisi](https://github.com/nicknisi/dotfiles)
* [nicolashery](https://github.com/nicolashery/mac-dev-setup)

## LICENSE

MIT 2016
