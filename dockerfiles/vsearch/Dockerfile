FROM debian:10.2

ADD VERSION .

ENV LANG=C.UTF-8

ENV VERSION=2.14.2

RUN apt-get update
RUN apt-get install -y \
    curl \
    tar

RUN mkdir -p /usr/local/vsearch
WORKDIR /usr/local/vsearch
RUN curl -s -L https://github.com/torognes/vsearch/releases/download/v${VERSION}/vsearch-${VERSION}-linux-x86_64.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/vsearch/bin:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
