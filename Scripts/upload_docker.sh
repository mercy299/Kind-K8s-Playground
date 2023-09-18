# USING BASH SCRIPT TO TAG AND UPLOAD AN IMAGE TO DOCKER HUB

#!/usr/bin/env bash

# Assumes that an image is built via `run_docker-compose.sh`

# Create dockerpath
dockerpath=kind-app
  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker login -u aniekeme01

# Tag the images with your Docker ID
docker tag $dockerpath:latest aniekeme01/$dockerpath

# Push image to a docker repository
docker push aniekeme01/$dockerpath