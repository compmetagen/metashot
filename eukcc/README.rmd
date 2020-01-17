The Docker uses conda. The docker will use a bash shell

Due to licensing issues, GeneMark needs to be installe separately from within the Docker.
You need to download GeneMark-ES from http://exon.gatech.edu/GeneMark/license_download.cgi and deposit the license key in your home directory (.e. the /root directory inside the docker) as .gm_key.

You need to add gmes_petap.pl your $PATH:

```sh
which gmes_petap.pl
#~/software/genemark_es/gmes_petap.pl
```

Get database from the EBI cluster

```sh
wget http://ftp.ebi.ac.uk/pub/databases/metagenomics/eukcc_db_v1.tar.gz
tar -xzvf eukcc_db_v1.tar.gz
mv eukcc_db_v1  eukccdb
```

Once the database is fetched you can invoke eukcc with:

eukcc --db eukccb MAG.fa
