FROM jenkins/jenkins:latest

USER root

RUN mkdir -p /var/jenkins_home/.gnupg && \
    chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
    chmod 700 /var/jenkins_home/.gnupg

RUN apt-get update && apt-get install -y dirmngr

RUN chown -R jenkins:jenkins /var/jenkins_home/.gnupg && \
    chmod -R 700 /var/jenkins_home/.gnupg

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    gnupg2 \
    software-properties-common

RUN apt-get update && apt-get install -y \
    chromium

USER jenkins
