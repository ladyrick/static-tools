ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

# https://busybox.net/downloads/
RUN wget -O- https://busybox.net/downloads/busybox-1.36.1.tar.bz2 | tar xjvf - \
    && cd busybox-* \
    && make defconfig && LDFLAGS="--static" make -j4 \
    && /collect.sh busybox
