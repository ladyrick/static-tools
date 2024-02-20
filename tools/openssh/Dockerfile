ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add openssl-dev openssl-libs-static zlib-dev zlib-static

# https://github.com/openssh/openssh-portable/tags
RUN all_proxy=$proxy curl -sL https://github.com/openssh/openssh-portable/archive/refs/tags/V_9_6_P1.tar.gz | tar zxvf - \
    && cd openssh-* \
    && autoreconf && LDFLAGS="-static" ./configure --sysconfdir /etc/ssh \
    && make -j4 && /collect.sh ssh ssh-keygen sshd scp sftp sftp-server
