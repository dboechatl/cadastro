WORKDIR /cadastro
FROM maven:latest AS build
FROM openjdk:20-jdk-slim
ARG JAR_FILE=cadastro/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
RUN mvn clean package -DskipTests
EXPOSE 8080
