FROM jenkins/jenkins:latest

USER root

# Membuat direktori /root/.gnupg
RUN mkdir -p /root/.gnupg && \
    chmod 700 /root/.gnupg && \
    chown jenkins:jenkins /root/.gnupg

USER jenkins
