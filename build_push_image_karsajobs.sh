#!/bin/sh

#membuat Docker image dari Dockerfile, dengan nama image item-app, dan memiliki tag v1
echo "Building image..."
echo
docker build -t karsajobs:latest .
echo "Build done"
echo
#Melihat daftar image di lokal
echo "List all images"
echo
docker images
sleep 5
echo
#Mengubah nama image agar sesuai dengan format Docker Hub
echo "Renaming docker image..."
docker tag karsajobs:latest ghcr.io/neromorph/a433-microservices-mufid96/karsajobs:latest
sleep 5
echo
#Login ke Github Packages
echo "Login to Github Packages"
echo
echo $PASSWORD_GITHUB | docker login -u neromorph ghcr.io --password-stdin
sleep 10
echo
#Mengunggah image ke Github Packages
echo "Pushing to Github Packages repository..."
echo
docker push ghcr.io/neromorph/a433-microservices-mufid96/karsajobs:latest
echo
echo "Logout from Github Packages"
echo
docker logout
echo
echo "Successfully logout"
echo
echo "All done!"