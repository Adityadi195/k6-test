pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    docker.build('jenkins-custom:latest', '.')  // Perbaikan di sini
                }
            }
        }

        // Contoh stage untuk melakukan setup K6 (tidak aktifkan jika tidak diperlukan)
        /*
        stage('Verify K6') {
            steps {
                echo 'Verifying K6...'
                sh 'chmod +x setup_k6.sh'
                sh './setup_k6.sh'
            }
        }
        */

        stage('Performance Testing') {
            steps {
                echo "Running performance tests..."
                // Jalankan k6 dengan output ke InfluxDB
                sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'

                // Jika Anda ingin menampilkan link hasil testing
                echo "http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"
            }
        }
    }
}
