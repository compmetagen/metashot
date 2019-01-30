FROM ubuntu:18.04

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

# DEBIAN_FRONTEND=noninteractive apt-get install -yq (for tzdata)
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    python3-pip \
    python3-tk\
    git \
    wget \
	  build-essential \
    cmake \
    mcl \
    ncbi-blast+ \
    muscle \
    mafft \
    prank \
    fasttree \
    phyml \
    paml

# set an alias for fasttree
RUN ln -s /usr/bin/fasttree /usr/bin/FastTree

# development version of wgd
RUN git clone https://github.com/arzwa/wgd.git
WORKDIR /wgd
RUN pip3 install .

RUN wget http://bioinformatics.psb.ugent.be/downloads/psb/i-adhore/i-adhore-3.0.01.tar.gz \
    -q -O /tmp/i-adhore-3.0.01.tar.gz
WORKDIR /tmp/
RUN tar -zxvf i-adhore-3.0.01.tar.gz
WORKDIR /tmp/i-adhore-3.0.01
RUN mkdir build && cd build && cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local/bin/i-adhore
RUN make && make install
ENV PATH="/usr/local/bin/i-adhore/bin:$PATH"
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*