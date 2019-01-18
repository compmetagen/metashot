wget https://gitlab.com/ezlab/busco_usecases/-/archive/master/busco_usecases-master.tar.gz
tar -zxvf busco_usecases-master.tar.gz
mv busco_usecases-master busco
mv busco/phylogenomics/* busco 
rm -rf busco_usecases-master.tar.gz busco/phylogenomics