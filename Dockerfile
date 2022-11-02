FROM openjdk:11-slim

RUN apt-get update && apt-get install -y curl unzip

RUN \
  curl "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip" -o /tmp/newrelic.zip \
  && unzip /tmp/newrelic.zip -d ./ \
  && rm /tmp/newrelic.zip

COPY ./scripts .
COPY ./newrelic.yml ./newrelic/newrelic.yml

RUN ["chmod", "+x", "./entrypoint.sh"]
ENV JAVA_OPTS

ENTRYPOINT ["./entrypoint.sh"]
