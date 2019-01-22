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












# Mash v2.1 (binaries)
RUN wget https://github.com/marbl/Mash/releases/download/v2.1/mash-Linux64-v2.1.tar \
    -q -O /tmp/mash-Linux64-v2.1.tar \
  && tar -xf /tmp/mash-Linux64-v2.1.tar -C /tmp
RUN cp /tmp/mash-Linux64-v2.1/mash /usr/local/bin/

# MUMmer v3.23 (source)
RUN apt-get install -y \
    csh \
    fig2dev \
    gnuplot \
    xfig
RUN wget https://sourceforge.net/projects/mummer/files/mummer/3.23/MUMmer3.23.tar.gz \
    -q -O /tmp/MUMmer3.23.tar.gz \
  && tar -xf /tmp/MUMmer3.23.tar.gz -C /usr/local/bin
WORKDIR /usr/local/bin/MUMmer3.23
RUN make check
RUN make install
ENV PATH="/usr/local/bin/MUMmer3.23:$PATH"
WORKDIR /

# Prodigal v2.6.3 (source) for CheckM and gANI
RUN wget https://github.com/hyattpd/Prodigal/archive/v2.6.3.tar.gz \
    -q -O /tmp/v2.6.3.tar.gz \
  && tar -zxf /tmp/v2.6.3.tar.gz -C /tmp
WORKDIR /tmp/Prodigal-2.6.3
RUN make install
WORKDIR /

# HMMER v3.2.1 (source) for CheckM
RUN wget http://eddylab.org/software/hmmer/hmmer-3.2.1.tar.gz \
    -q -O /tmp/hmmer-3.2.1.tar.gz \
  && tar -zxf /tmp/hmmer-3.2.1.tar.gz -C /tmp
WORKDIR /tmp/hmmer-3.2.1
RUN ./configure && make && make install
WORKDIR /tmp/hmmer-3.2.1/easel
RUN make install
WORKDIR /

# pplacer v2.1 (binaries) for CheckM
RUN wget https://github.com/matsen/pplacer/releases/download/v1.1.alpha17/pplacer-Linux-v1.1.alpha17.zip \
    -q -O /tmp/pplacer-Linux-v1.1.alpha17.zip
WORKDIR /tmp
RUN unzip pplacer-Linux-v1.1.alpha17.zip
RUN mkdir /usr/local/bin/pplacer
RUN cp -r pplacer-Linux-v1.1.alpha17/* /usr/local/bin/pplacer
ENV PATH="/usr/local/bin/pplacer:$PATH"
WORKDIR /
  
# CheckM 1.0.12
RUN apt-get install -y \
    expect
RUN pip install numpy \
  && pip install 'checkm-genome ==1.0.12'
RUN wget https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz \
    -q -O /tmp/checkm_data_2015_01_16.tar.gz
RUN mkdir /usr/local/share/checkm_data_2015_01_16 \
  && tar -xf /tmp/checkm_data_2015_01_16.tar.gz \
    -C /usr/local/share/checkm_data_2015_01_16
RUN wget https://raw.githubusercontent.com/compmetagen/metashot/master/drep/checkm.exp \
    -q -O /tmp/checkm.exp
RUN chmod +x /tmp/checkm.exp
RUN expect /tmp/checkm.exp

# ANIcalculator (aka gANI) v1
RUN wget https://ani.jgi-psf.org/download_files/ANIcalculator_v1.tgz \
    -q -O /tmp/ANIcalculator_v1.tgz \
  && tar -zxf /tmp/ANIcalculator_v1.tgz -C /usr/local/bin/
ENV PATH="/usr/local/bin/ANIcalculator_v1:$PATH"

# drep v2.2.3
RUN apt-get install -y \
    python3 \
    python3-pip \
  && pip3 install 'drep ==2.2.3'
RUN dRep bonus testDir --check_dependencies

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*