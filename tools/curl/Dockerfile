ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add openssl-dev nghttp2-dev nghttp2-static libssh2-dev libssh2-static openssl-libs-static zlib-static zlib-dev zstd-static zstd-dev

# https://github.com/curl/curl/releases/latest
RUN all_proxy=$proxy curl -sL https://github.com/curl/curl/releases/download/curl-8_5_0/curl-8.5.0.tar.xz | tar xJvf - \
    && cd curl-* \
    && LDFLAGS="-static" ./configure --disable-shared --enable-static --disable-ldap --enable-ipv6 --enable-unix-sockets --with-ssl --with-libssh2 \
    && make -j4 LDFLAGS="-static -all-static" \
    && /collect.sh src/curl
