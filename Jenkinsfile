pipeline {
  agent any
  stages {
    stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
        sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
      }
    }
  }
}
