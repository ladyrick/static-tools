ARG arch=amd64
FROM static-tools:build-base-$arch
ARG proxy=

RUN apk add go

# https://github.com/gokcehan/lf/releases
RUN all_proxy=$proxy curl -sL https://github.com/gokcehan/lf/archive/refs/tags/r32.tar.gz | tar zxvf -

RUN cd lf-* \
    && sed -i 's/autoquit = false/autoquit = true/g' opts.go \
    && HTTPS_PROXY=$proxy CGO_ENABLED=0 go build && /collect.sh lf
