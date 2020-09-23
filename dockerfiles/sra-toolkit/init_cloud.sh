#!/bin/sh

mkdir /root/.ncbi/
printf '/LIBS/GUID = "%s"\n' `uuidgen` > /root/.ncbi/user-settings.mkfg
printf '/libs/cloud/report_instance_identity = "true"\n' >> /root/.ncbi/user-settings.mkfg
# printf '/libs/cloud/accept_aws_charges = "true"\n' >> /root/.ncbi/user-settings.mkfg
# printf '/libs/cloud/accept_gcp_charges = "true"\n' >> /root/.ncbi/user-settings.mkfg