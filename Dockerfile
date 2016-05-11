FROM ubuntu
MAINTAINER arthuralvim <afmalvim@gmail.com>
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update && apt-get install -y \
    git \
    git-core \
    vim

RUN mkdir -p /root/Dropbox/dotfiles
COPY . /root/Dropbox/dotfiles
WORKDIR /root/Dropbox/dotfiles
