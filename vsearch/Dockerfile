FROM debian:9

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    pkg-config \
    automake \
    wget \
    zip \
    tar \
    gfortran \
    libblas-dev \
    liblapack-dev \
    libfreetype6 \
    libfreetype6-dev \
    libpng-dev \
    liblzma-dev \
    libbz2-dev \
    zlib1g \
    zlib1g-dev

# VSEARCH v2.10.3
RUN wget https://github.com/torognes/vsearch/archive/v2.10.3.tar.gz \
    -q -O /tmp/v2.10.3.tar.gz \
  && tar -zxf /tmp/v2.10.3.tar.gz -C /tmp
WORKDIR /tmp/vsearch-2.10.3
RUN ./autogen.sh && ./configure && make && make install
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
