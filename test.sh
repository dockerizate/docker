#!/bin/sh

docker-compose kill;
docker-compose run --rm -e PORT=3001 api npm run test;
docker-compose kill;

# $SHELL;
sleep 20;
