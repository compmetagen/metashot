FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    automake \
    prodigal \
    hmmer \
    wget \
    zip \
    python \
    perl \
    python-pip \
    cpanminus

RUN python -m pip install setuptools

RUN pip install numpy scipy matplotlib config

# pplacer v2.1 
RUN wget https://github.com/matsen/pplacer/releases/download/v1.1.alpha17/pplacer-Linux-v1.1.alpha17.zip \
    -q -O /tmp/pplacer-Linux-v1.1.alpha17.zip
WORKDIR /tmp
RUN unzip pplacer-Linux-v1.1.alpha17.zip
RUN mkdir /usr/local/bin/pplacer
RUN cp -r pplacer-Linux-v1.1.alpha17/* /usr/local/bin/pplacer
ENV PATH="/usr/local/bin/pplacer:$PATH"
WORKDIR /

# FastANI v1.1 (binary)
RUN wget https://github.com/ParBLiSS/FastANI/releases/download/v1.1/fastani-Linux64-v1.1.zip \
    -q -O /tmp/fastani-Linux64-v1.1.zip
WORKDIR /tmp
RUN unzip fastani-Linux64-v1.1.zip
RUN chmod +x fastANI \
  && cp fastANI /usr/local/bin/
WORKDIR /

# FastTree (binary)
RUN wget http://www.microbesonline.org/fasttree/FastTree \
    -q -O /usr/local/bin/FastTree \
  && chmod +x /usr/local/bin/FastTree

RUN cpanm Moose \
  && cpanm IPC::Run \
  && cpanm Bundle::BioPerl

# GTDBtk v0.1.6
RUN pip install "gtdbtk ==0.1.6"
WORKDIR /usr/local/lib/python2.7/dist-packages/gtdbtk/config/
RUN cp config_template.py config.py
RUN sed -i 's/^GENERIC_PATH = .*/GENERIC_PATH = "/db/"/' config.py
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*