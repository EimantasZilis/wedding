#!/bin/bash

# Error and quit with status > 0  on first error
set -e

# # Create directories for tarballs
mkdir -p "tarball_builds"

echo "Creating tarball"
cp -r docker_deployment/docker-compose tarball_builds/app

cd tarball_builds/

tar -czvf "app_$(date +'%d-%b-%y').tar.gz" app
rm -rf app




