ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add openssl-dev openssl-libs-static zlib-dev zlib-static

# https://github.com/git/git/tags
# TODO: support curl
RUN all_proxy=$proxy curl -sL https://github.com/git/git/archive/refs/tags/v2.43.0.tar.gz | tar xzvf - \
    && cd git-* \
    && make configure && LDFLAGS='-static' ./configure --without-tcltk \
    && make -j4 \
    && /collect.sh git
