pipeline {
    agent any
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Menjalankan build Docker image dengan tag jenkins-custom:latest
                    def customImage = docker.build('jenkins-custom:latest', '.')
                    customImage.inside {
                        // Jalankan perintah apapun yang diperlukan di dalam container
                        sh 'echo "Docker container is running"'
                    }
                }
            }
        }
        
        stage('Performance Testing') {
            steps {
                // Menggunakan image yang telah dibuat sebelumnya untuk menjalankan k6
                script {
                    docker.image('jenkins-custom:latest').inside {
                        echo "Running performance tests..."
                        sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
                        echo "http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"
                    }
                }
            }
        }
    }
}
