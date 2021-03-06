FROM metashot/base:1.0

ADD VERSION .

ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV PPLACER_VERSION=1.1.alpha19

# checkm version
ENV VERSION=1.1.2
ENV VERSION_DATA=2015_01_16

RUN apt-get update

# pysam specific: libbz2-dev zlib1g-dev liblzma-dev bzip2 
RUN apt-get -y install \
  curl \
  unzip \
  python3 \
  python3-pip \
  build-essential \
  libbz2-dev \
  zlib1g-dev \
  liblzma-dev \
  bzip2 \
  prodigal=${PRODIGAL_VERSION} \
  hmmer=${HMMER_VERSION}

# install pplacer
RUN mkdir -p /usr/local/pplacer
WORKDIR /usr/local/pplacer
RUN curl -s -L https://github.com/matsen/pplacer/releases/download/v${PPLACER_VERSION}/pplacer-linux-v${PPLACER_VERSION}.zip -o pplacer.zip; \
    unzip -j pplacer.zip; \
    rm -rf pplacer.zip
WORKDIR /
ENV PATH="/usr/local/pplacer:${PATH}"

RUN pip3 install Cython
RUN pip3 install numpy matplotlib pysam "checkm-genome== ${VERSION}"

# download and extract the checkm data
RUN mkdir -p /usr/local/checkm_data
WORKDIR /usr/local/checkm_data
RUN curl -s -L https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_${VERSION_DATA}.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
RUN checkm data setRoot /usr/local/checkm_data

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
