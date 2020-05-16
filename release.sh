#!/bin/bash

REGISTRY="metashot"

set -e

git pull

for path in dockerfiles/*; do 
    toolname="$(basename "${path}")"
    version=$(cat "${path}"/VERSION)
    
    echo $toolname $version
    
    docker build -t $REGISTRY/$toolname:latest $path
    docker tag $REGISTRY/$toolname:latest $REGISTRY/$toolname:$version
    docker push $REGISTRY/$toolname:latest
    docker push $REGISTRY/$toolname:$version
    docker rmi $REGISTRY/$toolname:latest
    docker rmi $REGISTRY/$toolname:$version
done