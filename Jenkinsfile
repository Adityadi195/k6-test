pipeline {
    agent any
    stages {
        stage('Verify K6') {
            docker {
            image 'jenkins-chromium-k6:latest'
            args '-u root'
          }
        }
        stage('Performance Testing') {
            steps {
                echo "Running performance tests..."
                sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/testing.js'

                echo "http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"
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