FROM debian:jessie

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        gcc \
        git \
        libc6-dev \
        make \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Install sickle
RUN git clone https://github.com/najoshi/sickle.git \
    && git checkout tags/v1.33 \
    && cd sickle \
    && make \
    && cd .. \
    && cp sickle/sickle /usr/bin \
    && rm -r sickle