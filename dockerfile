# Use the Jenkins image as the base image
FROM jenkins/jenkins:lts

# Update the package lists and install Docker client
USER root
RUN apt-get update -&& \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Set the working directory and switch back to the Jenkins user
