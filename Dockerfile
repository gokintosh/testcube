FROM openjdk:27-alpine as build


COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2,rw ./mvnw -B package -DskipTests

FROM openjdk:17-alpine
COPY --from=build target/*jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]