# INTRODUCTION

These are my dotfiles + basic configuration files. Here I describe
how I set my developer environment (OS X El Capitan or Linux Ubuntu).
The steps below were tested on OS X El Capitan and Ubuntu 16.04 (still WIP).

# DOTFILES

## INSTALLATION

```bash
$ curl -L https://raw.github.com/arthuralvim/dotfiles/master/install | sh
```

or

```bash
$ git clone https://github.com/arthuralvim/dotfiles.git && cd dotfiles && sh all/install.sh
```

### Requirements

* Git

## HOW TO RUN

```bash
$ sh all/install
```

Also you can install some modules individually. Example:

```bash
$ sh version-control/git/install.sh
$ sh zsh/install.sh
$ sh profile/install.sh
$ sh search/fzf/install.sh
```

## PROFILE

Basic dotfiles installation.

* Copy dotfiles.
* Change default shell to zsh: `chsh -s /bin/zsh`.
* Install Fuzzy Finder.

## DOCKER

```bash
$ docker pull ubuntu
$ docker build -t arthur/dotfiles .
$ docker run -i -t arthur/dotfiles /bin/bash
```

## ACKNOWLEDGEMENT

I have mainly rewrote [Davidson Fellipe](https://github.com/davidsonfellipe)'s [dotfile](https://github.com/davidsonfellipe/dotfiles)
but was inspired by all theses guys:

* [alrra](https://github.com/alrra/dotfiles/)
* [mathiasbynens](https://github.com/mathiasbynens/dotfiles)
* [necolas](https://github.com/necolas/dotfiles)
* [nicknisi](https://github.com/nicknisi/dotfiles)
* [nicolashery](https://github.com/nicolashery/mac-dev-setup)

## LICENSE

MIT 2016
