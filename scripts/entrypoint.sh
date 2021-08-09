#!/bin/bash

JAR_FILE=./app.jar
if [ ! -f "$JAR_FILE" ]; then
    echo "$JAR_FILE must be present to run the app"
    exit 1
fi

java -jar app.jar