FROM debian:10.2

ADD VERSION .

ENV LANG=C.UTF-8

ENV VERSION=2.0.1

RUN apt-get update

RUN apt-get -y install \
  curl \
  tar \
  python2.7 \
  python-biopython

RUN mkdir -p /eggnog_mapper
WORKDIR /eggnog_mapper
RUN curl -s -L https://github.com/eggnogdb/eggnog-mapper/archive/${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
