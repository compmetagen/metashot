FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y \
    tar \
    wget \
  && rm -rf /var/lib/apt/lists/*

# MetaBAT v2.12.1
RUN wget https://bitbucket.org/berkeleylab/metabat/downloads/metabat-static-binary-linux-x64_v2.12.1.tar.gz \
    -q -O /tmp/metabat-static-binary-linux-x64_v2.12.1.tar.gz \
  && tar -zxf /tmp/metabat-static-binary-linux-x64_v2.12.1.tar.gz -C /usr/local/bin
ENV PATH=$PATH:/usr/local/bin/metabat
RUN rm -rf /tmp/metabat-static-binary-linux-x64_v2.12.1.tar.gz
