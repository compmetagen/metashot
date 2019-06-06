FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update 

RUN apt-get -y install \
  bash \
	python3 \
	wget

WORKDIR /NGStools
RUN wget http://cab.spbu.ru/files/release3.13.1/SPAdes-3.13.1-Linux.tar.gz \
  && tar -xf SPAdes-3.13.1-Linux.tar.gz
WORKDIR /

ENV PATH="/NGStools/SPAdes-3.13.1-Linux/bin:$PATH"