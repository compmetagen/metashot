#!/bin/sh

mkdir /root/.ncbi/
printf '/LIBS/GUID = "%s"\n' `uuidgen` > /root/.ncbi/user-settings.mkfg