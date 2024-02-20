ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add ncurses-static

# https://github.com/vim/vim/tags
RUN curl -sLO 'https://github.com/vim/vim/archive/refs/tags/v9.1.0080.zip' \
    && unzip v*.zip \
    && cd vim-* \
    && LDFLAGS="-static" ./configure --disable-channel --disable-gpm --disable-gtktest --disable-gui \
        --disable-netbeans --disable-nls --disable-selinux --disable-smack --disable-sysmouse \
        --disable-xsmp --enable-multibyte --with-features=huge --without-x --with-tlib=ncursesw \
    && make -j4 \
    && /collect.sh src/vim src/xxd/xxd
