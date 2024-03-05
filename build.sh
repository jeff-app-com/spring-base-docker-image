#!/bin/bash

docker build --build-arg JDK_TAG=11.0.12_7-jdk -t jeff/base-spring-docker-image -t jeff/base-spring-docker-image-11-slim .

docker build --build-arg JDK_TAG=17.0.10_7-jdk -t jeff/base-spring-docker-image-17-slim .
