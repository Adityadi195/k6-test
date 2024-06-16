pipeline {
  agent any
   environment {
        CHROMEDRIVER_PATH = "/path/to/chromedriver"
    }
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
    stage('Run Selenium Tests') {
        steps {
             script {
                    def chromeOptions = new org.openqa.selenium.chrome.ChromeOptions()
                    chromeOptions.setBinary("/path/to/google-chrome")

                    System.setProperty("webdriver.chrome.driver", env.CHROMEDRIVER_PATH)
                    def driver = new org.openqa.selenium.chrome.ChromeDriver(chromeOptions)
                    driver.get("http://localhost:3000/d/k6/hasil-testing")
                    println("Page title: ${driver.getTitle()}")

                    driver.quit()
                }
            }
        }
     }
}
 
