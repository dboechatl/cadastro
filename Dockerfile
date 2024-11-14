# Primeiro estágio de build
FROM maven:latest AS build
WORKDIR /cadastro
COPY pom.xml /cadastro/pom.xml
COPY src /cadastro/src
RUN mvn clean package -DskipTests

# Segundo estágio para a imagem final
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /cadastro/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
EXPOSE 8080
