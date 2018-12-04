FROM debian:9

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    automake \
    wget \
    git \
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
    ncbi-blast+ \
    mafft \
  && rm -rf /var/lib/apt/lists/*

# HMMER v3.2.1
RUN wget http://eddylab.org/software/hmmer/hmmer-3.2.1.tar.gz \
    -q -O /tmp/hmmer-3.2.1.tar.gz \
  && tar -zxf /tmp/hmmer-3.2.1.tar.gz -C /tmp
WORKDIR /tmp/hmmer-3.2.1
RUN ./configure && make && make install
WORKDIR /tmp/hmmer-3.2.1/easel
RUN make install
WORKDIR /
RUN rm -rf /tmp/hmmer-3.2.1.tar.gz /tmp/hmmer-3.2.1

# VSEARCH v2.9.1
RUN wget https://github.com/torognes/vsearch/archive/v2.9.1.tar.gz \
    -q -O /tmp/v2.9.1.tar.gz \
  && tar -zxf /tmp/v2.9.1.tar.gz -C /tmp
WORKDIR /tmp/vsearch-2.9.1
RUN ./autogen.sh && ./configure && make && make install
WORKDIR /
RUN rm -rf /tmp/v2.9.1.tar.gz /tmp/vsearch-2.9.1

RUN wget http://microbiology.se/sw/Metaxa2_2.2.tar.gz \
  && tar -zxvf Metaxa2_2.2.tar.gz
WORKDIR Metaxa2_2.2
RUN wget https://raw.githubusercontent.com/compmetagen/metashot/master/metaxa2/install_metaxa2 \
  && chmod +x install_metaxa2 \
  && ./install_metaxa2