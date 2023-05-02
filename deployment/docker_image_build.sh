#!/bin/bash


# Error and quit with status > 0  on first error
set -e

echo "Building docker image:" ${APP_REGISTRY}/${APP_IMAGE}:${APP_TAG}
docker build -f docker_deployment/image/Dockerfile . -t ${APP_REGISTRY}/${APP_IMAGE}:${APP_TAG}

# echo "Pushing to DockerHub"
docker push ${APP_REGISTRY}/${APP_IMAGE}:${APP_TAG}





