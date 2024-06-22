# Dockerfile
FROM jenkins/jenkins:latest

USER root

# Install dependencies including dirmngr and gnupg
RUN apt-get update \
    && apt-get install -y \
        dirmngr \
        gnupg \
        wget \
        apt-transport-https \
        ca-certificates \
        lsb-release \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create .gnupg directory and set permissions, similar to script
RUN mkdir -p /var/jenkins_home/.gnupg \
    && chown -R jenkins:jenkins /var/jenkins_home/.gnupg \
    && chmod 700 /var/jenkins_home/.gnupg

# Import GPG key with retry mechanism, similar to script
RUN set -eux; \
    gpg --batch --homedir /var/jenkins_home/.gnupg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69 \
    || (echo "Failed to receive GPG keys. Retrying..." && sleep 10 && gpg --batch --homedir /var/jenkins_home/.gnupg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69)

# Add k6 repository, similar to script
RUN echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list

# Update package index and install k6, similar to script
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       k6 \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to Jenkins user
USER jenkins

CMD ["k6", "version"]
