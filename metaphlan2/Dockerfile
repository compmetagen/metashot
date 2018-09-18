FROM debian:stretch

RUN apt-get update && apt-get install -y \
    python-numpy \
    python-pandas \
    python-pip \
    python-biopython \
    python-biom-format \
    bowtie2 \
    mercurial

RUN python -m pip install --upgrade pip && pip install 'setuptools >=14.0' \
  && pip install msgpack

RUN hg clone https://bitbucket.org/biobakery/metaphlan2 /src/metaphlan2 \
  && cd /src/metaphlan2 \
  && hg up 2.7.63 \
  && ./metaphlan2.py --install \
  && cd /

RUN apt-get install -y \
  wget 

RUN wget https://raw.githubusercontent.com/compmetagen/metashot/master/metaphlan2/merge_metaphlan_tables.py \
  && cp merge_metaphlan_tables.py /src/metaphlan2/utils \
  && chmod +x /src/metaphlan2/utils/merge_metaphlan_tables.py

ENV PATH=$PATH:/src/metaphlan2:/src/metaphlan2/utils:/src/metaphlan2/utils/hclust2
