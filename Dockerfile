# First stage: Build the application
FROM maven:3.8.7-eclipse-temurin-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and project files
COPY pom.xml .
COPY src ./src

# Clean and package the application
RUN mvn clean install -DskipTests

# Second stage: Run the application
FROM eclipse-temurin:17-jre-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage into the container
COPY --from=build /app/target/acm-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
