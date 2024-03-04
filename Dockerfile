FROM registry.access.redhat.com/ubi8/openjdk-21-runtime:1.18-2 AS build

ARG COMMIT_SHA=<not-specified>
ARG BUILD_FILE_NAME="mia_template_service_name_placeholder"

LABEL maintainer="%CUSTOM_PLUGIN_CREATOR_USERNAME%" \
      name="mia_template_service_name_placeholder" \
      description="%CUSTOM_PLUGIN_SERVICE_DESCRIPTION%" 

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

USER root
RUN mkdir -p /home/java/app
RUN echo "mia_template_service_name_placeholder: $COMMIT_SHA" >> /home/java/app/commit.sha
RUN chown 185:185 /home/java/app
USER 185

# We make four distinct layers so if there are application changes the library layers can be re-used
COPY --chown=185 target/quarkus-app/lib/ /deployments/lib/
COPY --chown=185 target/quarkus-app/*.jar /deployments/
COPY --chown=185 target/quarkus-app/app/ /deployments/app/
COPY --chown=185 target/quarkus-app/quarkus/ /deployments/quarkus/

USER 185
ENV AB_JOLOKIA_OFF=""
ENV JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"