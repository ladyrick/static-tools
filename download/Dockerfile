FROM static-tools:build-base-amd64
ARG proxy=

RUN all_proxy=$proxy curl -sL 'https://github.com/gokcehan/lf/releases/download/r31/lf-linux-amd64.tar.gz' | tar xzvf - \
    && ARCH=amd64 /collect.sh lf

RUN all_proxy=$proxy curl -sL 'https://github.com/gokcehan/lf/releases/download/r31/lf-linux-arm64.tar.gz' | tar xzvf - \
    && ARCH=arm64v8 /collect.sh lf

RUN all_proxy=$proxy curl -sL 'https://github.com/antonmedv/walk/releases/download/v1.7.0/walk_linux_amd64' -o walk \
    && ARCH=amd64 /collect.sh walk

RUN all_proxy=$proxy curl -sL 'https://github.com/antonmedv/walk/releases/download/v1.7.0/walk_linux_arm64' -o walk \
    && ARCH=arm64v8 /collect.sh walk

RUN all_proxy=$proxy curl -sL 'https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-amd64' -o jq \
    && ARCH=amd64 /collect.sh jq

RUN all_proxy=$proxy curl -sL 'https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-arm64' -o jq \
    && ARCH=arm64v8 /collect.sh jq
