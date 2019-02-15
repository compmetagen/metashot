FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get install -y \
    md5sum \
    wget


ENV IPS_VER_MAJOR 5
ENV IPS_VER 5.33-72.0
ENV PANTHER_DATA_VER 12.0

RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/$IPS_VER/interproscan-$IPS_VER-64-bit.tar.gz
    -q -O /tmp/interproscan-$IPS_VER-64-bit.tar.gz
RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/$IPS_VER/interproscan-$IPS_VER-64-bit.tar.gz.md5
    -q -O /tmp/interproscan-$IPS_VER-64-bit.tar.gz.md5

RUN md5sum -c /tmp/interproscan-$IPS_VER-64-bit.tar.gz.md5

RUN tar -pxvzf /tmp/interproscan-$IPS_VER-64-bit.tar.gz \
    -C /ips


RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/data/panther-data-$PANTHER_DATA_VER.tar.gz
    q -O /tmp/panther-data-$PANTHER_DATA_VER.tar.gz
RUN wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/data/panther-data-$PANTHER_DATA_VER.tar.gz.md5
    q -O /tmp/panther-data-$PANTHER_DATA_VER.tar.gz.md5

RUN md5sum -c /tmp/panther-data-$PANTHER_DATA_VER.tar.gz.md5

RUN tar -pxvzf /tmp/panther-data-$PANTHER_DATA_VER.tar.gz \
    -C /ips/data


RUN apt-get install -y \
    perl \
    python3 \
    default-jre

# Clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/*