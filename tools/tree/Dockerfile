ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

# https://github.com/Old-Man-Programmer/tree/tags
RUN all_proxy=$proxy curl -sL https://github.com/Old-Man-Programmer/tree/archive/refs/tags/2.1.1.tar.gz | tar zxvf - \
    && cd tree-* && make -j4 LDFLAGS=-static && /collect.sh tree
