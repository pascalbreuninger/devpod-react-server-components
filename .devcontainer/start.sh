#!/bin/bash

IMAGE_ID=$(docker ps --filter ancestor=postgres-rsc --format json | jq -r '.Id')
echo $IMAGE_ID
if [ -z "$IMAGE_ID" ]
then
        echo "postgres container is already running"
else  
        docker run -d --publish 5432:5432 postgres-rsc 
fi

