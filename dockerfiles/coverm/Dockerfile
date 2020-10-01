FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=0.4.0

RUN apt-get update

RUN apt-get -y install \
  curl

# Install Miniconda3
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN rm Miniconda3-latest-Linux-x86_64.sh
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge

RUN conda install -y coverm=${VERSION}
