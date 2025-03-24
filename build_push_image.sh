#!/bin/bash

# membuat docker image
echo "Menyusun image item-app:v1"
docker build -t item-app:v1 .
echo "Penyusunan image selesai!"
echo ""

# melihat daftar image
echo "Daftar image local"
docker images
echo ""

# mengubah nama image agar sesuai dengan format
echo "Mengubah tag item-app sesuai format"
docker tag item-app:v1 ghcr.io/azizars71/a433-microservices/item-app:v1
echo ""

# mengunggah image ke docker hub
echo "Unggah image ke docker hub"
docker push ghcr.io/azizars71/a433-microservices/item-app:v1
echo "Unggah selesai!"