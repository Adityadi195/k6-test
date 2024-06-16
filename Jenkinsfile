pipeline {
  agent any
  stages {
      stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
        sh 'k6 run scripts/ewoks.js'
      }
    }
  }
}

