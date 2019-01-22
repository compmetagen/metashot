FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    cmake \
    ncbi-blast+ \
    perl \
    bioperl \
    hmmer \
    exonerate \
    augustus \
    git \
    cpanminus

RUN cpanm IO::All
RUN git clone https://github.com/stajichlab/FGMP.git
WORKDIR /FGMP
RUN git checkout tags/v1.0.1 \
    && cpanm . \
    && chmod +x /FGMP/src/fgmp.pl
ENV PATH=$PATH:/FGMP/src/
WORKDIR /

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*