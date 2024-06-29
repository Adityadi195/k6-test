FROM jenkins/jenkins:latest

USER root

RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    apt-transport-https \
    curl \
    unzip \
    chromium && \
    rm -rf /var/lib/apt/lists/*

# Set permissions for Jenkins user
RUN mkdir -p /var/jenkins_home/.gnupg && \
    chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
    chmod 700 /var/jenkins_home/.gnupg

# Install K6
RUN wget -q -O - https://dl.k6.io/key.gpg | apt-key add - && \
    echo "deb https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list && \
    apt-get update && \
    apt-get install -y k6

# Switch back to Jenkins user
USER jenkins

# Set environment variables
ENV CHROME_BIN=/usr/bin/chromium