FROM debian:stretch

ENV TOOLNAME metaphlan2 

ENV PACKAGES python-numpy python-biom-format python-biopython bowtie2 wget unzip make xz-utils ca-certificates mercurial python-yaml libsys-hostname-long-perl
RUN apt-get update -y 
RUN apt-get install -y --no-install-recommends ${PACKAGES}

ENV PREFIX /biobox/
RUN mkdir -p ${PREFIX}/src/ ${PREFIX}/bin/ ${PREFIX}/lib/ ${PREFIX}/share/ 
ENV PATH=${PREFIX}/bin:${PREFIX}/src/${TOOLNAME}:${PATH}

RUN hg clone https://bitbucket.org/biobakery/metaphlan2 ${PREFIX}/src/${TOOLNAME}
RUN metaphlan2.py --install