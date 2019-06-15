FROM ubuntu
MAINTAINER arthuralvim <afmalvim@gmail.com>

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y \
    zsh \
    curl \
    git \
    git-core \
    vim

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
RUN chsh -s `which zsh`

RUN git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

# RUN echo 'source "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc

# RUN echo 'source "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.zshrc

RUN . "source $HOME/.homesick/repos/homeshick/homeshick.sh"

RUN homeshick clone arthuralvim/dotfiles
