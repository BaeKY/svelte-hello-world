#!/bin/sh

REPOSITORY_DOMAIN=ghcr.io
REPOSITORY_ORGANIZATION=baeky
# REPOSITORY_NAMESPACE=svelte-hello-world
REPOSITORY_PREFIX=$REPOSITORY_DOMAIN/$REPOSITORY_ORGANIZATION
PACKAGE_NAME=$(sed "s/@//" <<< $npm_package_name)
IMAGE_TAG=$REPOSITORY_PREFIX/$PACKAGE_NAME:$npm_package_version
# IMAGE_TAG=$REPOSITORY_PREFIX/$PACKAGE_NAME:latest

echo $IMAGE_TAG

docker build -t $PACKAGE_NAME:$npm_package_version .
docker tag $PACKAGE_NAME:$npm_package_version $IMAGE_TAG
docker push $IMAGE_TAG
