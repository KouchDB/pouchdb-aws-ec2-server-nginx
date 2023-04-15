#!/bin/sh

# https://stackoverflow.com/questions/64221861/an-error-failed-to-solve-with-frontend-dockerfile-v0
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

docker build --build-arg USERNAME=user --build-arg PASSWORD=pass -t pouchdb_server .

mkdir -p data
docker run -p 5987:8080 -v$PWD/data:/data -t pouchdb_server . &