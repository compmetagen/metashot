# eggnog

## Fetch eggNOG databases

```sh
docker run --rm -v /path/eggnog_data:/eggnog_data eggnog-mapper \
    python /eggnog_mapper/download_eggnog_data.py --data_dir /eggnog_data
```

## Run eggNOG-mapper
```sh
docker run --rm -v /path/eggnog_data:/eggnog_data -v /path/data:/data
    python /eggnog_mapper/eggnog-mapper -i /data/seq.fa --output /data/seq_out -m diamond --data_dir /eggnog_data
```
