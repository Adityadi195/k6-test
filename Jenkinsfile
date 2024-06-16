pipeline {
  agent any
   // environment {
   //      CHROMEDRIVER_PATH = "/chromedriver"
   //  }
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
    stage('Open URL') {
            steps {
                script {
                    openshift.withCluster() {
                        openshift.withProject() {
                            openshift.withApplication("nama-aplikasi") {
                                openshift.rsh("xdg-open http://localhost:3000/d/k6/hasil-testing")
                            }
                        }
                    }
             }
     }
}
 
