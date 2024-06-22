FROM jenkins/jenkins:latest

USER root

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

RUN gpg --homedir /root/.gnupg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69

RUN echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | tee /etc/apt/sources.list.d/k6.list

RUN apt-get update && apt-get install -y k6

CMD ["k6", "version"]

USER jenkins
