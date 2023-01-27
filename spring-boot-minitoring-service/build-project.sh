#!/bin/bash

# build the app
mvn clean package
# stop container
docker stop spring-boot-minitoring-service-jvm
# remove container
docker rm spring-boot-minitoring-service-jvm
# remove container image
docker rmi spring/spring-boot-minitoring-service-jvm:latest
# build container image
docker build -f Dockerfile.jvm -t spring/spring-boot-minitoring-service-jvm .
# run container
docker run -id --network=metrics-net --name spring-boot-minitoring-service-jvm -p 8080:8080 spring/spring-boot-minitoring-service-jvm