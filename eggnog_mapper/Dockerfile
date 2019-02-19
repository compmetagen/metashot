FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get install -y \
    python2 \
    python-biopython \
    wget

# eggNOG v1.0.3
RUN wget https://github.com/jhcepas/eggnog-mapper/archive/1.0.3.tar.gz
    -q -O /tmp/1.0.3.tar.gz \
  && tar -zxf /tmp/1.0.3.tar.gz -C /opt \
  && mv /opt/eggnog-mapper-1.0.3 /opt/eggnog-mapper

# Clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/*