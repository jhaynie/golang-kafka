FROM jhaynie/golang-alpine

RUN apk add pkgconf openssl-dev cyrus-sasl-dev openssh-client

ENV VERSION=1.3.0

RUN mkdir -p /tmp && \
    curl -L https://github.com/edenhill/librdkafka/archive/v${VERSION}.tar.gz | tar -xz -C /tmp && \
    cd /tmp/librdkafka-${VERSION} && \
    ./configure && make && make install