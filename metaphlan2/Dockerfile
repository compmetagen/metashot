FROM debian:sid

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        metaphlan2 \
    && rm -rf /var/lib/apt/lists/*