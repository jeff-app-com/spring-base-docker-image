#!/bin/bash

# Use this to test locally

docker run -e APP_NAME=test_app_name -e NEW_RELIC_LICENSE_KEY=123 jeff/base-spring-docker-image