FROM debian:9

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y \
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
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

# VSEARCH v2.9.1
RUN wget https://github.com/torognes/vsearch/archive/v2.9.1.tar.gz \
    -q -O /tmp/v2.9.1.tar.gz \
  && tar -zxf /tmp/v2.9.1.tar.gz -C /tmp
WORKDIR /tmp/vsearch-2.9.1
RUN ./autogen.sh && ./configure && make && make install
WORKDIR /
RUN rm -rf /tmp/v2.9.1.tar.gz /tmp/vsearch-2.9.1
