FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -pl observable-main -am -DskipTests

FROM eclipse-temurin:17-jre-jammy
COPY --from=build /app/observable-main/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]