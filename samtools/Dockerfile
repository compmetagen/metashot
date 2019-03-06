FROM debian:stretch

RUN apt-get update && apt-get install -y \
    samtools \
    bcftools \
  && rm -rf /var/lib/apt/lists/*