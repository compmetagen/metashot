FROM continuumio/miniconda

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update

RUN apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    gzip \
    libgl1-mesa-glx 


RUN cpan App::cpanminus
RUN cpanm Test::Pod
RUN cpanm Logger::Simple
RUN cpanm Parallel::ForkManager.pm
RUN cpanm YAML
RUN cpanm Hash::Merge module

RUN conda init bash
SHELL ["/bin/bash", "-c"]
RUN conda create -n eukcc -c bioconda -c biocore -c ostrokach hmmer>3.2 pplacer python=3.7
# we recommend installing ete3 from conda:
RUN echo "source activate eukcc" > ~/.bashrc
RUN conda install -c etetoolkit -c anaconda ete3 pyqt>5

# EukCC
RUN pip3 install --upgrade pip
RUN pip3 install PyQt5
WORKDIR /tmp
RUN git clone https://github.com/Finn-Lab/EukCC
RUN cd EukCC; pip3 install .
WORKDIR /
