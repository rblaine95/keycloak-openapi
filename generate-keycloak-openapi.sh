#!/usr/bin/env bash

mkdir /output

git clone \
    --config core.symlinks=true \
    --depth 1 \
    --branch ${VERSION} \
    https://github.com/keycloak/keycloak.git

cd /keycloak
./mvnw -pl quarkus/deployment,quarkus/dist -am -DskipTests clean install

cd services
mvn -s ../maven-settings.xml -Pjboss-release -DskipTests clean package

cp -R ./target/apidocs-rest/swagger/apidocs/* /output
mv /output/openapi.json /output/keycloak-${VERSION}.json
mv /output/openapi.yaml /output/keycloak-${VERSION}.yaml
