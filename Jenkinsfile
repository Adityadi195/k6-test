pipeline {
  agent any
  stages {
    // stage('Verify K6') {
    //   steps {
    //   			echo 'Verifying K6...'
    //         sh 'chmod +x setup_k6.sh'
				//     sh './setup_k6.sh'
    //     }
    // }
    stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
        docker-compose run --rm k6 run /scripts/ewoks.js
      }
    }
  }
}

