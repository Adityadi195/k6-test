pipeline {
  agent any
  stages {
    // stage('Build Docker Image') {
    //         steps {
    //             echo 'Building Docker image...'
    //             script {
    //                 docker.image('jenkins-custom:latest').build('-t jenkins-custom:latest .')
    //             }
    //         }
    //     }
  //   stage('Verify K6') {
  //     steps {
	// echo 'Verifying K6...'
  //       sh 'chmod +x setup_k6.sh'
	// sh './setup_k6.sh'
  //     }
  //   }
    stage('Performance Testing') {
      steps {
        echo "Running performance tests..."
         sh 'k6 run --out influxdb=http://influxdb:8086/k6 scripts/ewoks.js'
	// sh 'chmod +x run-load-test.sh'
	// sh './run-load-test.sh'
	echo "http://localhost:3000/d/k6/hasil-testing?orgId=1&refresh=5s"
      }
    }
  }
}
 
