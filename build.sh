#!/bin/bash

docker build --build-arg JDK_TAG=11-slim -t jeff/base-spring-docker-image -t jeff/base-spring-docker-image-11-slim .

docker build --build-arg JDK_TAG=17-slim -t jeff/base-spring-docker-image-17-slim .
