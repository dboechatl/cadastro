# Primeiro estágio de build
FROM maven:latest AS build
WORKDIR /cadastro
COPY pom.xml .           # Copia o arquivo pom.xml
#COPY src ./src           # Copia o diretorio src
RUN mvn clean package -DskipTests  # Executa o build da aplicação

# Segundo estágio para a imagem final
FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /cadastro/target/*.jar app.jar  # Copia o JAR do primeiro estagio para o segundo

ENTRYPOINT ["java", "-jar", "/app/app.jar"]  # Executa o JAR copiado
EXPOSE 8080
