FROM openjdk:17-oracle as build


COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2,rw ./mvnw -B package -DskipTests

FROM openjdk:17-oracle
COPY --from=build target/*jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]