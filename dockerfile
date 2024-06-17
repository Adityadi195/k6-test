USER jenkins

# Use the official Jenkins base image
FROM jenkins/jenkins:latest

# Switch to root user to install dependencies
USER root

# Install dependencies
RUN apt-get update && \
    apt-get install -y chromium-browser

# Switch back to the Jenkins user
USER jenkins

# Copy the script to run Chromium
COPY run_chromium.sh /usr/local/bin/run_chromium.sh
RUN chmod +x /usr/local/bin/run_chromium.sh

# Start Jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
