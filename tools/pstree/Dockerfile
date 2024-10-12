ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

# https://github.com/FredHucht/pstree/releases
RUN all_proxy=$proxy curl -sL https://github.com/FredHucht/pstree/archive/refs/tags/v2.40.tar.gz | tar zxvf - \
    && cd pstree-* && make -j4 LDFLAGS=-static && /collect.sh pstree
