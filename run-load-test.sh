#!/bin/bash

# Define the URL to open
URL="http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"

# Run Chromium in headless mode
chromium-browser --headless --disable-gpu --no-sandbox --remote-debugging-port=9222 --window-size=1280x1024 "$URL"


# apt-get install xsel
# text="$(xsel -o)"
# google-chrome --headless --disable-gpu --no-sandbox --remote-debugging-port=3000 "http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"


# docker compose up -d influxdb grafana
# echo "--------------------------------------------------------------------------------------"
# echo "Load testing with Grafana dashboard http://localhost:3000/d/k6/k6-load-testing-results"
# echo "--------------------------------------------------------------------------------------"
# docker compose run --rm k6 run /scripts/ewoks.js
