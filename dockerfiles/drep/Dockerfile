FROM metashot/base:1.0

ADD VERSION .

ENV MUMMER_VERSION=3.23+dfsg-4
ENV MASH_VERSION=2.1
ENV PRODIGAL_VERSION=1:2.6.3-4
ENV HMMER_VERSION=3.2.1+dfsg-1
ENV PPLACER_VERSION=1.1.alpha19
ENV CHECKM_VERSION=1.1.2
ENV CHECKM_VERSION_DATA=2015_01_16
ENV ANICALC_VERSION=1

# drep version
ENV VERSION=2.6.2

RUN apt-get update

# pysam: libbz2-dev zlib1g-dev liblzma-dev bzip2 
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
  hmmer=${HMMER_VERSION} \
  mummer=${MUMMER_VERSION}

# Mash v2.1 (binaries)
RUN mkdir -p /usr/local/mash
WORKDIR /usr/local/mash
RUN curl -s -L https://github.com/marbl/Mash/releases/download/v${MASH_VERSION}/mash-Linux64-v${MASH_VERSION}.tar | \
    tar -xf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/mash:${PATH}"

# ANIcalculator (aka gANI) v1
RUN mkdir -p /usr/local/anicalculator
WORKDIR /usr/local/anicalculator
RUN curl -s -L https://ani.jgi-psf.org/download_files/ANIcalculator_v${ANICALC_VERSION}.tgz | \
    tar -zxf - --strip-components=1
ENV PATH="/usr/local/anicalculator:${PATH}"

# install pplacer
RUN mkdir -p /usr/local/pplacer
WORKDIR /usr/local/pplacer
RUN curl -s -L https://github.com/matsen/pplacer/releases/download/v${PPLACER_VERSION}/pplacer-linux-v${PPLACER_VERSION}.zip -o pplacer.zip; \
    unzip -j pplacer.zip; \
    rm -rf pplacer.zip
WORKDIR /
ENV PATH="/usr/local/pplacer:${PATH}"

RUN pip3 install Cython
RUN pip3 install numpy matplotlib pysam "checkm-genome== ${CHECKM_VERSION}"

# download and extract the checkm data
RUN mkdir -p /usr/local/checkm_data
WORKDIR /usr/local/checkm_data
RUN curl -s -L https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_${CHECKM_VERSION_DATA}.tar.gz | \
  tar -zxf - --strip-components=1
WORKDIR /
RUN checkm data setRoot /usr/local/checkm_data

# drep
RUN pip3 install "drep== ${VERSION}"

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
