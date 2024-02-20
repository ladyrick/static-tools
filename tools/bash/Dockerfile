ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add ncurses-dev ncurses-static readline-dev readline-static

# https://ftp.gnu.org/gnu/bash/
RUN curl -sL https://ftp.gnu.org/gnu/bash/bash-5.2.21.tar.gz | tar zxvf - \
    && cd bash-* \
    && sed -i 's/bash_cv_func_strtoimax = yes/bash_cv_func_strtoimax = no/' m4/strtoimax.m4 \
    && autoconf -f && ./configure --enable-static-link --without-bash-malloc \
    && make -j4 && /collect.sh bash
