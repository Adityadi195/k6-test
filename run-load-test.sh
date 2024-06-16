#!/bin/bash

# Mendeteksi sistem operasi yang digunakan
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Sistem operasi Linux
    if command -v google-chrome > /dev/null; then
        google-chrome --headless --no-sandbox --disable-gpu --remote-debugging-port=9222 "http://localhost:3000/d/k6/hasil-testing"
    elif command -v chromium-browser > /dev/null; then
        chromium-browser --headless --no-sandbox --disable-gpu --remote-debugging-port=9222 "http://localhost:3000/d/k6/hasil-testing"
    else
        echo "Google Chrome atau Chromium tidak ditemukan."
    fi
else
    echo "Unsupported OS for opening URL."
fi



# docker compose up -d influxdb grafana
# echo "--------------------------------------------------------------------------------------"
# echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
# echo "--------------------------------------------------------------------------------------"
# docker compose run --rm k6 run /scripts/ewoks.js
