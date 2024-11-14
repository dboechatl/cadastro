FROM openjdk:17-jdk-alpine
FROM maven:latest AS build
WORKDIR /cadastro
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080
