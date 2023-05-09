#!/bin/bash

# Error and quit with status > 0  on first error
set -e

# # Create directories for tarballs
mkdir -p "temp_tarball"

echo "Creating tarball"
cp -r deployment/docker-compose temp_tarball

# cd temp_tarball

tar -czvf "docker_tarball.tar.gz" temp_tarball
rm -rf temp_tarball




