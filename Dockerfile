ARG JDK_TAG=17.0.10_7-jdk

FROM eclipse-temurin:${JDK_TAG}

RUN apt-get update \
  && apt-get install -y curl unzip \
  && rm -rf /var/lib/apt/lists/*


RUN \
  curl "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/8.9.1/newrelic-java.zip" -o /tmp/newrelic.zip \
  && unzip /tmp/newrelic.zip -d ./ \
  && rm /tmp/newrelic.zip

COPY ./scripts .
COPY ./newrelic.yml ./newrelic/newrelic.yml

RUN ["chmod", "+x", "./entrypoint.sh"]

ENV JAVA_OPTS=
ENTRYPOINT ["./entrypoint.sh"]
