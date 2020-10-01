FROM debian:10.2

ENV LANG=C.UTF-8

RUN apt-get update

# Required by Nextflow for tracing (https://www.nextflow.io/docs/latest/tracing.html)
RUN apt-get -y install \
  gawk \
  dateutils \
  grep \
  procps \
  sed \
  coreutils

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
