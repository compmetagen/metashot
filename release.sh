#!/bin/bash

REGISTRY="metashot"

set -e

git pull

for path in dockerfiles/*; do 
    toolname="$(basename "${path}")"
    version=$(cat "${path}"/VERSION)
    echo $toolname $version
    
    docker build -t $REGISTRY/$IMAGE:latest $path
    docker tag $REGISTRY/$IMAGE:latest $REGISTRY/$IMAGE:$version
    docker push $USERNAME/$IMAGE:latest
    docker push $REGISTRY/$IMAGE:$version
done