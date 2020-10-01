FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.2

RUN apt-get update

RUN apt-get -y install \
  curl

RUN mkdir -p /usr/local/mash
WORKDIR /usr/local/mash
RUN curl -s -L https://github.com/marbl/Mash/releases/download/v${VERSION}/mash-Linux64-v${VERSION}.tar | \
    tar -xf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/mash:${PATH}"

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
