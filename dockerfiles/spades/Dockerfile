FROM metashot/base:1.0

ADD VERSION .

ENV VERSION=3.14.0

RUN apt-get update

RUN apt-get -y install \
  bash \
	curl \
  python

RUN mkdir -p /usr/local/spades
WORKDIR /usr/local/spades
RUN curl -s http://cab.spbu.ru/files/release${VERSION}/SPAdes-${VERSION}-Linux.tar.gz | \
    tar -zxf - --strip-components=1
WORKDIR /
ENV PATH="/usr/local/spades/bin:${PATH}"

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*