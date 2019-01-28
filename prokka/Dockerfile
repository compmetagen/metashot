FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update 

RUN apt-get install -y \
    build-essential \
    libdatetime-perl \
    libxml-simple-perl \
    libdigest-md5-perl \
    git \
    default-jre \
    bioperl \
    cpanminus

# prokka v1.13.4
RUN cpanm Bio::Perl
RUN git clone https://github.com/tseemann/prokka.git /prokka
WORKDIR /prokka
RUN git checkout tags/v1.13.4
WORKDIR /
ENV PATH="/prokka/bin/:$PATH"
RUN prokka --setupdb

# Clean 
RUN rm -rf /var/lib/apt/lists/*