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
    docker push $USERNAME/$toolname:latest
    docker push $REGISTRY/$toolname:$version
    docker rmi $USERNAME/$toolname:latest
    docker rmi $USERNAME/$toolname:$version
done