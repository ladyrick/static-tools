ARG arch=
ARG platform=
FROM --platform=$platform $arch/alpine:3.19
ARG arch=
ENV ARCH=$arch

WORKDIR /work

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add build-base clang cmake automake autoconf curl wget musl linux-headers pkgconf

COPY collect.sh /collect.sh
