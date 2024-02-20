ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add ncurses-dev ncurses-static libcap-dev libcap-static

# https://github.com/htop-dev/htop/releases
RUN all_proxy=$proxy curl -sL https://github.com/htop-dev/htop/releases/download/3.3.0/htop-3.3.0.tar.xz | tar xJvf - \
    && cd htop-* \
    && ./autogen.sh && ./configure --enable-static && make -j4 \
    && /collect.sh htop
