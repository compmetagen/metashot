FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=2.10.7

RUN apt-get update
RUN apt-get -y install \
  libxml-libxml-perl \
  curl \
  tar \
  uuid-runtime

RUN mkdir -p /usr/local/ncbi/sra-toolkit
WORKDIR /usr/local/ncbi/sra-toolkit
RUN curl -s https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-ubuntu64.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /usr/local/ncbi/sra-toolkit/bin
ADD init.sh init_cloud.sh ./
RUN chmod +x init.sh init_cloud.sh
WORKDIR /
ENV PATH="/usr/local/ncbi/sra-toolkit/bin:${PATH}"




RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*