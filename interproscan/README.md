# InterProScan base image

```sh
IPS_VER_MAJOR=5
IPS_VER=5.33-72.0
PANTHER_DATA_VER=12.0
IPS_HOST_DIR=ips

mkdir $IPS_HOST_DIR
cd $IPS_HOST_DIR

wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/$IPS_VER/interproscan-$IPS_VER-64-bit.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/$IPS_VER/interproscan-$IPS_VER-64-bit.tar.gz.md5
md5sum -c interproscan-$IPS_VER-64-bit.tar.gz.md5
tar -pxvzf interproscan-$IPS_VER-64-bit.tar.gz

cd data
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/data/panther-data-$PANTHER_DATA_VER.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/$IPS_VER_MAJOR/data/panther-data-$PANTHER_DATA_VER.tar.gz.md5
md5sum -c panther-data-$PANTHER_DATA_VER.tar.gz.md5
tar -pxvzf panther-data-$PANTHER_DATA_VER.tar.gz
```

Mount the ips folder to /ips.

```sh
docker run --rm -v $IPS_HOST_DIR:/ips interproscan /ips/interproscan.sh
```