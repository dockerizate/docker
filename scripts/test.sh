#!/bin/sh

docker-compose kill;
docker-compose -f ../docker-compose.yml run --rm -w /home/node/api/ -e PORT=3001 api node ace test;
docker-compose kill;

# $SHELL;
sleep 20;
