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
    emboss \
    git \
    cpanminus

RUN cpanm IO::All

RUN git clone https://github.com/stajichlab/FGMP.git
WORKDIR /FGMP
RUN cpanm . 
## && chmod +x /FGMP/src/fgmp.pl
ENV PATH=$PATH:/FGMP/src/
WORKDIR /

ENV FGMP="/FGMP"
ENV FGMPTMP="/FGMPTMP"
ENV PERL5LIB="$PERL5LIB:/FGMP/lib"

# Clean 
RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*