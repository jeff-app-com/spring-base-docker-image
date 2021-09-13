#!/bin/bash

if [[ -z "$APP_NAME" ]]; then
    echo "APP_NAME must be present" 1>&2
    exit 1
fi

NEW_RELIC_ENABLED=false
NEW_RELIC_ENV=development

if [[ $SPRING_PROFILES_ACTIVE == *"dev-env"* ]]; then
    NEW_RELIC_ENABLED=true
    NEW_RELIC_ENV=staging
fi
if [[ $SPRING_PROFILES_ACTIVE == *"prod-env"* ]]; then
    NEW_RELIC_ENABLED=true
    NEW_RELIC_ENV=production
fi

if [[ -z "$NEW_RELIC_LICENSE_KEY" ]]; then
    NEW_RELIC_ENABLED=false
    NEW_RELIC_LICENSE_KEY=__not_set__
fi

echo "NEW_RELIC_ENABLED=$NEW_RELIC_ENABLED; NEW_RELIC_LICENSE_KEY=${NEW_RELIC_LICENSE_KEY:0:3}***; NEW_RELIC_ENV=${NEW_RELIC_ENV}"

sed -i 's/"<%= license_key %>"/'$NEW_RELIC_LICENSE_KEY'/' ./newrelic/newrelic.yml
sed -i 's/"<%= common_agent_enabled %>"/'$NEW_RELIC_ENABLED'/' ./newrelic/newrelic.yml
sed -i 's/"<%= common_app_name %>"/'$APP_NAME'/' ./newrelic/newrelic.yml
sed -i 's/"<%= staging_app_name %>"/'$APP_NAME' (Staging)/' ./newrelic/newrelic.yml
sed -i 's/"<%= development_app_name %>"/'$APP_NAME' (Development)/' ./newrelic/newrelic.yml
sed -i 's/"<%= test_app_name %>"/'$APP_NAME' (Test)/' ./newrelic/newrelic.yml

JAR_FILE=./app.jar
if [ ! -f "$JAR_FILE" ]; then
    echo "$JAR_FILE must be present to run the app"
    exit 1
fi

java -javaagent:./newrelic/newrelic.jar -jar app.jar