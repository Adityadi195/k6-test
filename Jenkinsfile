pipeline {
  agent any
  stages {
    stage('Verify K6') {
      steps {
	echo 'Verifying K6...'
        sh 'chmod +x setup_k6.sh'
	sh './setup_k6.sh'
      }
    }
    stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
        sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
      }
    }
    stage('Open Grafana Dashboard') {
            steps {
                script {
                    def grafanaUrl = 'http://localhost:3000/d/k6/hasil-testing'
                    echo "Grafana Dashboard: <a href='${grafanaUrl}'>Hasil Testing</a>"
                    // Atau bisa juga menggunakan openUrl untuk langsung membuka tab baru di browser
                    // openUrl(grafanaUrl)
                }
            }
        }
  }
}
