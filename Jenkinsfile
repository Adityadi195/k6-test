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
    stage('Run Selenium Tests') {
        steps {
             script {
                    def chromeOptions = new org.openqa.selenium.chrome.ChromeOptions()
                    chromeOptions.addArguments("--headless") // Contoh: menjalankan Chrome di mode headless

                    def driver = new org.openqa.selenium.chrome.ChromeDriver(chromeOptions)
                    driver.get("https://www.google.com")
                    println("Page title: ${driver.getTitle()}")

                    driver.quit()
                }
            }
        }
     }
}
 
