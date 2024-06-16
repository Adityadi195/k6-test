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
                    // Menggunakan Chrome dalam mode headless
                    def chromeOptions = new ChromeOptions()
                    // chromeOptions.addArguments("--headless")
                    chromeOptions.addArguments("--no-sandbox")
                    chromeOptions.addArguments("--disable-dev-shm-usage")
                    
                    WebDriver driver = new ChromeDriver(chromeOptions)
                    
                    // Buka halaman web
                    driver.get("http://localhost:3000/d/k6/hasil-testing")
                    
                    // Tunggu beberapa saat
                    Thread.sleep(5000)
                    
                    // Lakukan aksi-aksi WebDriver di sini (misalnya klik, input, dll)
                    
                    // Tutup browser
                    // driver.quit()
                }
            }
        }
     }
 }
