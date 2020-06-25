#!/bin/bash

for d in dockerfiles/*; do 
    TOOLNAME="$(basename "${d}")" 
    sh release.sh $TOOLNAME
done