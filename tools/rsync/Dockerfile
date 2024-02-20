ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add openssl-dev openssl-libs-static zstd-dev zstd-static lz4-dev lz4-static

# https://github.com/Cyan4973/xxHash/releases/latest
RUN all_proxy=$proxy curl -sL https://github.com/Cyan4973/xxHash/archive/refs/tags/v0.8.2.tar.gz | tar zxvf - \
    && cd xxHash-* && make -j

# https://download.samba.org/pub/rsync/src/
RUN curl -sL https://download.samba.org/pub/rsync/src/rsync-3.2.7.tar.gz | tar zxvf - \
    && xxhash_dir=$(readlink -f xxHash-*) \
    && cd rsync-* \
    && CFLAGS="-static -I$xxhash_dir -L$xxhash_dir" ./configure --disable-md2man \
    && make -j4 && /collect.sh rsync
