# Use the official Eclipse Temurin OpenJDK image to run the application
# https://hub.docker.com/_/eclipse-temurin
FROM eclipse-temurin:17-jre-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from your local machine into the container
COPY target/acm-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Define the command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
