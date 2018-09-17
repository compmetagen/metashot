FROM debian:stretch

RUN apt-get update && apt-get install -y \
    python-numpy \
    python-pandas \
    python-pip \
    python-biopython \
    bowtie2 \
    mercurial 

RUN python -m pip install --upgrade pip && pip install 'setuptools >=14.0' \
  && pip install msgpack

RUN hg clone https://bitbucket.org/biobakery/metaphlan2 /src/metaphlan2 \\
  && cd /src/metaphlan2 \
  && hg up 2.7.63 \
  && ./metaphlan2.py --install \
  cd /

ENV PATH=$PATH:/src/metaphlan2
