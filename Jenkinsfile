pipeline {
  agent any
  stages {
    stage('Verify K6') {
      steps {
                sh 'ls -l' // Tambahkan langkah ini untuk memeriksa isi direktori kerja saat build
                sh 'chmod +x setup_k6.sh' // Pastikan bahwa setup_k6.sh dapat diakses
                sh './setup_k6.sh' // Pastikan perintah ini sesuai dengan penggunaan setup_k6.sh Anda
        }
    }
    stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
        sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
      }
    }
  }
}

