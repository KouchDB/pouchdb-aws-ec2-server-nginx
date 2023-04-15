#!/bin/sh
PATH=/usr/app/node_modules/pouchdb-server/bin/:$PATH
pouchdb-server -o 0.0.0.0 -d /data &
/docker-entrypoint.sh nginx
wait