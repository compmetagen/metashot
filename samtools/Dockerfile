FROM debian:stretch

RUN apt-get update && apt-get install -y \
    samtools \
    bcftools \
    tabix \
    bedtools \
  && rm -rf /var/lib/apt/lists/*