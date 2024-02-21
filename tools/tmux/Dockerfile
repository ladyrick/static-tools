ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add libevent-dev libevent-static ncurses-dev ncurses-static bison

# https://github.com/tmux/tmux/releases
RUN all_proxy=$proxy curl -sL https://github.com/tmux/tmux/archive/3.4.tar.gz | tar -xzvf - \
    && cd tmux-* && ./autogen.sh && ./configure --enable-static --enable-sixel --with-TERM=screen \
    && make -j4 && /collect.sh tmux
