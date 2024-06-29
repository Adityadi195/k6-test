# Gunakan image Jenkins sebagai base image
FROM jenkins/jenkins:latest

# Ubah ke user root untuk menginstal dependensi
USER root

# Salin shell script ke dalam container
COPY setup-k6.sh /usr/local/bin/setup-k6.sh

# Berikan izin eksekusi pada script
RUN chmod +x /usr/local/bin/setup-k6.sh

# Jalankan script untuk menginstal K6
RUN /usr/local/bin/setup-k6.sh

# Instal dependensi tambahan yang diperlukan
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Tambahkan user Jenkins ke grup Docker
RUN usermod -aG docker jenkins

# Kembali ke user Jenkins
USER jenkins

# Jalankan Jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
