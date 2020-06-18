FROM debian:10.2

ADD VERSION .

ENV LANG=C.UTF-8

ENV VERSION=0.2.12

RUN apt-get update
RUN apt-get -y install \
    python3 \
    python3-pip

# NCBI genome download
RUN pip3 install "ncbi-genome-download== ${VERSION}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*