FROM debian:stretch

RUN apt-get update && apt-get install -y \
    samtools \
    bcftools \
    tabix \
  && rm -rf /var/lib/apt/lists/*