FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    python3 \
    python3-pip

RUN pip3 install \
  numpy \
  scipy \
  pandas \
  matplotlib \
  biopython \
  pysam \
  matplotlib

# Clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/*