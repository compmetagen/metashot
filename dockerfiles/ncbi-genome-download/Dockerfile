FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=0.2.12

RUN apt-get update
RUN apt-get -y install \
    python3 \
    python3-pip

# NCBI genome download
RUN pip3 install "ncbi-genome-download== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*