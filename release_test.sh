#!/bin/bash

TOOLNAME=$1

REGISTRY="metashot"
DOCKERPATH="dockerfiles/${TOOLNAME}"
VERSION=$(cat ${DOCKERPATH}/VERSION)

echo Building $TOOLNAME $VERSION
   
docker build -t $REGISTRY/$TOOLNAME:latest $DOCKERPATH
docker tag $REGISTRY/$TOOLNAME:latest $REGISTRY/$TOOLNAME:$VERSION

