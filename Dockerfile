FROM maven:3.8.5-openjdk-17 AS builder

WORKDIR /build

COPY pom.xml .
COPY src ./src
RUN mvn clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /build/target/*.jar my-app.jar

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "my-app.jar"]

