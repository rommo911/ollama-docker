#!/bin/bash
COMPOSE_FILE="docker-compose-ollama-gpu-stable-diff.yaml"
if [ "$1" == "stop" ]; then 
    docker compose -f ${COMPOSE_FILE} stop 
    exit $?
fi

if [ "$1" == "down" ]; then 
    docker compose -f ${COMPOSE_FILE} down 
    exit $?
fi

docker compose -f ${COMPOSE_FILE} pull # will trigger a warning for pulling the local stable-diff image 
set -e 
docker compose -f ${COMPOSE_FILE} build  # build the stable-diff image 

if [ "$1" == "-d" ]; then  # allow to pass -d so it runs in background 
    docker compose -f ${COMPOSE_FILE} up -d 
    exit $?
else 
    docker compose -f ${COMPOSE_FILE} up  
    exit $?
fi

