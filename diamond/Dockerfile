FROM alpine:3.8

LABEL maintainer="Davide Albanese <davide.albanese@fmach.it>"

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# linux-headers for limits.h
RUN apk add --no-cache \
    linux-headers \ 
    gcc \
    g++ \
    cmake \
    libstdc++ \
    zlib \
    zlib-dev \
    automake \
    tar \
    wget

RUN wget https://github.com/bbuchfink/diamond/archive/v0.9.23.tar.gz \
    -q -O /tmp/v0.9.23.tar.gz
WORKDIR /tmp
RUN tar -zxf v0.9.23.tar.gz
WORKDIR /tmp/diamond-0.9.23
RUN ./build_simple.sh 
RUN cp diamond /usr/local/bin
RUN rm -rf /tmp/*
