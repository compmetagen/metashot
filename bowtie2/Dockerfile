FROM debian:stretch

RUN apt-get update && apt-get install -y \
    unzip \
    wget \
    gcc \
    g++ \
    libtbb-dev

WORKDIR /NGStools/
ENV work_dir="/NGStools/bowtie2-2.3.4.3"

RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.4.3/bowtie2-2.3.4.3-linux-x86_64.zip \
    unzip bowtie2-2.3.4.3-linux-x86_64.zip \
    rm -rf bowtie2-2.3.4.3-linux-x86_64.zip

ENV PATH="${work_dir}:${PATH}"