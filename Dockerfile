FROM maven:latest AS build
FROM openjdk:20-jdk-slim
COPY --from=build target/${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
RUN mvn clean package -DskipTests
EXPOSE 8080
