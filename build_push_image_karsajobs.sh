#!/bin/bash

# exit saat error
set -e

# loading env
# if [ -f .env ]; then
#     export $(cat .env | xargs)
# fi

# variabel IMAGENAME
IMAGE_NAME="ghcr.io/azizars71/karsajobs:latest"

# build image
echo "Membangun image Docker: $IMAGE_NAME"
docker build -t $IMAGE_NAME .

# login ke Github Packages, token telah disimpan ke env
echo "Login ke Github"
echo "$GHCR_TOKEN" | docker login ghcr.io -u azizars71 --password-stdin

# push ke Github Packages
echo "Push ke Github Packages dengan nama $IMAGE_NAME"
docker push $IMAGE_NAME

# SELESAI
echo "SELESAI"