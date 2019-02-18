FROM debian:stretch

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update
RUN apt-get install -y \
    perl \
    python3 \
    default-jre

# Clean 
RUN rm -rf /var/lib/apt/lists/* /tmp/*