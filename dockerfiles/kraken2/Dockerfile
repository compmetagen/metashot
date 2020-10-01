FROM debian:10.2

ADD VERSION .

ENV LANG=C.UTF-8

ENV VERSION=2.0.9-beta
ENV BRACKEN_VERSION=2.6.0

RUN apt-get update

RUN apt-get -y install \
  curl \
  build-essential \
  python2.7

RUN ln -s /usr/bin/python2.7 /usr/bin/python

ENV KRAKEN2_DIR=/usr/local/kraken2

# install kraken2
WORKDIR /tmp
RUN curl -s -L https://github.com/DerrickWood/kraken2/archive/v${VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
RUN mkdir -p $KRAKEN2_DIR
RUN ./install_kraken2.sh $KRAKEN2_DIR
RUN ln -s $KRAKEN2_DIR/kraken2 $KRAKEN2_DIR/kraken2-build $KRAKEN2_DIR/kraken2-inspect /usr/local/bin
RUN rm -rf /tmp/*

# install bracken
RUN mkdir /usr/local/bracken
WORKDIR /usr/local/bracken
RUN curl -s -L https://github.com/jenniferlu717/Bracken/archive/v{$BRACKEN_VERSION}.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/bracken/src
RUN make
ENV PATH="/usr/local/bracken:${PATH}"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
