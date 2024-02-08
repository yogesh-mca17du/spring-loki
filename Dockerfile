FROM eclipse-temurin:21

RUN mkdir /app
COPY build/libs/helloWorld-0.0.1-SNAPSHOT.jar /app

ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.26.0/opentelemetry-javaagent.jar /opt/opentelemetry-agent.jar

ENTRYPOINT ["java", "-javaagent:/opt/opentelemetry-agent.jar", "-Dio.opentelemetry.javaagent.slf4j.simpleLogger.defaultLogLevel=ERROR","-jar","/app/helloWorld-0.0.1-SNAPSHOT.jar"]