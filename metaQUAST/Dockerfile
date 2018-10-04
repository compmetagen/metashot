FROM debian:stretch

RUN apt-get update -y && apt-get install -y \
    wget \
    make \
    xz-utils \
    unzip \
    g++ \
    python3 \
    python-matplotlib \
    perl \
    zlib1g-dev \
    python-pip

RUN python -m pip install 'setuptools >=14.0'

RUN wget https://sourceforge.net/projects/quast/files/quast-5.0.0.tar.gz \
    && tar -xzf quast-5.0.0.tar.gz \
    && cd quast-5.0.0 \
    && ./setup.py install_full 
