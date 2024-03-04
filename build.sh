#!/bin/bash

docker build --build-arg JDK_TAG=11-jdk -t jeff/base-spring-docker-image -t jeff/base-spring-docker-image-11-slim .

docker build --build-arg JDK_TAG=17-jdk -t jeff/base-spring-docker-image-17-slim .
