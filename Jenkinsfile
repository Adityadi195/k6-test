pipeline {
    agent {
        docker {
            image 'jenkins-ch-k6:latest' // Nama image Docker yang telah dibangun
            args '-u root' // Jalankan sebagai root untuk dapat menjalankan Chromium
        }
    }
    stage('Setup Docker') {
            steps {
                sh '''
                docker inspect -f . jenkins-ch-k6:latest || docker pull jenkins-ch-k6:latest
                '''
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
