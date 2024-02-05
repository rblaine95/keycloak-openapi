FROM eclipse-temurin:21

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y maven

COPY generate-keycloak-openapi.sh .
RUN chmod a+x /generate-keycloak-openapi.sh

ENV VERSION 23.0.6

CMD "/generate-keycloak-openapi.sh"
