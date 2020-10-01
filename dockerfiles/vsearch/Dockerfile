FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.14.2

RUN apt-get update
RUN apt-get install -y \
    curl \
    tar \
    zlib1g-dev \
    zlib1g \
    libbz2-1.0 \
    libbz2-dev

RUN mkdir -p /usr/local/vsearch
WORKDIR /usr/local/vsearch
RUN curl -s -L https://github.com/torognes/vsearch/releases/download/v${VERSION}/vsearch-${VERSION}-linux-x86_64.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/vsearch/bin:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
