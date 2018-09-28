FROM debian:stretch

RUN apt-get update && apt-get install -y \
    python-numpy \
    python-pandas \
    python-pip \
    python-biopython \
    python-biom-format \
    bowtie2 \
    muscle \
    ncbi-blast+ \
    raxml \
    wget \
    mercurial \
    build-essential \
    libncurses5-dev \
    libbz2-dev \
    liblzma-dev \
    zlib1g-dev

RUN python -m pip install 'setuptools >=14.0' \
  && pip install msgpack \
  && pip install pysam

RUN wget http://sourceforge.net/projects/samtools/files/samtools/0.1.19/samtools-0.1.19.tar.bz2 \
  && tar -xvjf ./samtools-0.1.19.tar.bz2 \
  && cd /samtools-0.1.19 \
  && make \
  && cd /

RUN hg clone https://bitbucket.org/biobakery/metaphlan2 /src/metaphlan2 \
  && cd /src/metaphlan2 \
  && hg up 2.7.63 \
  && ./metaphlan2.py --install \
  && cd /

ENV PATH=$PATH:/src/metaphlan2:/src/metaphlan2/utils:/src/metaphlan2/utils/hclust2:/samtools-0.1.19/:/samtools-0.1.19/bcftools/
