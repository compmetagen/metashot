FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get -y install \
  build-essential \
  cmake \
  zlib1g-dev \
  libbz2-dev \
  prodigal \
  hmmer \
  bash \
	python \
	wget \
  git

RUN git clone https://github.com/davidealbanese/spades.git /spades
WORKDIR /spades
RUN git checkout metaplasmid_3.13.0
WORKDIR /spades/assembler
RUN chmod +x spades_compile.sh \
  && PREFIX=/usr/local ./spades_compile.sh
WORKDIR /
