# eggNOG base image

Download the database(s) (e.g. bact):

```sh
# docker run --rm -ti -v /path/data_dir:/path/data_dir eggnog_mapper /bin/bash
root@d25a77fd8ea7:/# /opt/eggnog-mapper/download_eggnog_data.py --data_dir /path/data_dir bact
```

Run eggnog-mapper:

```sh
# docker run --rm -v /path/data_dir:/path/data_dir -v /path/seq_dir:/path/seq_dir \
    eggnog_mapper python emapper.py -i /path/seq_dir/seq.fa --output /path/seq_dir/seq_out -d bact --data_dir /path/data_dir
```

Use the `--data_dir` option.