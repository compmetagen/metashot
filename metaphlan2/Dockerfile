FROM debian:stretch

RUN apt-get update && apt-get install -y \
    python-numpy \
    python-pandas \
    python-pip \
    python-biopython \
    python-biom-format \
    bowtie2 \
    muscle \
    bcftools \
    ncbi-blast+ \
    raxml \
    wget \
    mercurial \
    build-essentials \
    libncurses5-dev

RUN python -m pip install --upgrade pip && pip install 'setuptools >=14.0' \
  && pip install msgpack \
  && pip install pysam

RUN wget http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2 \
  && tar -xvjf ./sam/samtools-0.1.19.tar.bz2 \
  && wget wget http://www.zlib.net/zlib-1.2.11.tar.gz \
  && tar -xvzf zlib-1.2.11.tar.gz \
  && cd zlib-1.2.11 \
  && ./configure --prefix=./
  && cp ./zlib.h ./samtools-0.1.19 \
  && cp ./zconf.h ./samtools-0.1.19 \
  && cd ./samtools-0.1.19 \
  && make \
  && cd /

RUN hg clone https://bitbucket.org/biobakery/metaphlan2 /src/metaphlan2 \
  && cd /src/metaphlan2 \
  && hg up 2.7.63 \
  && ./metaphlan2.py --install \
  && cd /

ENV PATH=$PATH:/src/metaphlan2:/src/metaphlan2/utils:/src/metaphlan2/utils/hclust2:/samtools-0.1.19
