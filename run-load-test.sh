#!/bin/bash

# URL yang ingin dibuka
URL="http://localhost:3000/d/k6/hasil-testing"

# Memeriksa apakah Google Chrome terinstal
if ! command -v google-chrome &> /dev/null
then
    echo "Google Chrome tidak ditemukan. Menginstal Google Chrome..."
    
    # Menambahkan kunci Google Chrome dan repo
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    
    # Memperbarui daftar paket dan menginstal Google Chrome
    sudo apt-get update
    sudo apt-get install -y google-chrome-stable
fi

# Membuka URL di Google Chrome
google-chrome "$URL"



# docker compose up -d influxdb grafana
# echo "--------------------------------------------------------------------------------------"
# echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
# echo "--------------------------------------------------------------------------------------"
# docker compose run --rm k6 run /scripts/ewoks.js
