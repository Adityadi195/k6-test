pipeline {
    agent {
        docker {
            image 'jenkins-chromium-k6:latest' // Nama image Docker yang telah dibangun
            args '-u root' // Jalankan sebagai root untuk dapat menjalankan Chromium
        }
    }
    stages {
        stage('Run Performance Test') {
            steps {
                echo 'Running performance tests...'
                sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
            }
        }
        stage('Open Chromium') {
            steps {
                echo 'Opening Chromium...'
                sh 'chromium --headless --disable-gpu --no-sandbox --remote-debugging-port=9222'
            }
        }
    }
}
