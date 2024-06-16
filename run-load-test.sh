#!/bin/bash

# Mendeteksi sistem operasi yang digunakan
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Sistem operasi Linux
    xdg-open "http://localhost:3000/d/k6/hasil-testing"
# docker compose up -d influxdb grafana
# echo "--------------------------------------------------------------------------------------"
# echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
# echo "--------------------------------------------------------------------------------------"
# docker compose run --rm k6 run /scripts/ewoks.js
