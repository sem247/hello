#!/usr/bin/env bash

docker stop my-wiremock
docker rm my-wiremock
docker stop myjenkins
docker rm myjenkins

docker network inspect jenkins_local_network >/dev/null || docker network create --driver bridge jenkins_local_network

docker run -d \
    --name myjenkins \
    -v ~/jenkins_home:/var/jenkins_home \
    -p 8080:8080 \
    -p 50000:50000 \
    --network jenkins_local_network \
    jenkins/jenkins:lts

docker run -d \
    --name my-wiremock \
    -v $PWD/assets:/home/wiremock \
    -p 6060:6060 \
    --network jenkins_local_network \
    rodolpheche/wiremock:2.25.1-alpine \
    --port 6060 \
    --verbose

curl -X POST \
    --data "@ecr-listing.json" \
    http://localhost:6060/__admin/mappings/new