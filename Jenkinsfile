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
	sh 'chmod +x run-load-test.sh'
	// sh './run-load-test.sh'
	sh 'google-chrome --headless --disable-gpu --no-sandbox --remote-debugging-port=3000 "$URL"'
      }
    }
    // stage('Run Google Chrome Headless') {
    //         steps {
    //             echo 'Running Google Chrome in headless mode...'
    //             script {
    //                 // Install necessary packages if not already installed
    //                 sh '''
    //                 sudo apt-get update
    //                 sudo apt-get install -y google-chrome-stable
    //                 sudo apt-get install -y dbus
    //                 sudo service dbus start
    //                 mkdir -p /tmp/Crashpad
    //                 '''

    //                 // Run Google Chrome in headless mode
    //                 sh 'google-chrome --headless --disable-gpu --no-sandbox --remote-debugging-port=3000 "$URL"'
    //             }
    //         }
    //     }
  }
}
 
