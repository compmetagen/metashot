# InterProScan base image

Download and extract InterProScan 5 and the Panther models (https://github.com/ebi-pf-team/interproscan/wiki/HowToDownload). 
Mount the InteProScan directory to `/ips`:

```sh
docker run --rm -v interproscan_dir:/ips interproscan /ips/interproscan.sh
```