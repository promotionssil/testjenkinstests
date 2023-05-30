pipeline {


		agent any


 
  stages {
    stage('Install Libraries') {
      steps {
        sh '''
        # Install libraries
	    pip install --upgrade pip
	    pip install -r requirements.txt
	    ls -al
	    '''
      }
    }

    stage('Execute Tests') {
      parallel {
        stage('Tests with Chrome') {
          steps {
            wrap([$class: 'BuildUser']) {
                sh 'echo "${BUILD_USER}"'
            }
            sh '''
            # Print Chrome version
            # google-chrome --version
            # Launch Robot Tests with Chrome
            robot tests\testdemo1.robot  -d results/chrome --log log_chrome.html --output output_chrome.xml --report report_chrome.html cases/JTI/TNR
            '''
          }
        }
      }
    }
  }

  post {
    always {
      step([
        $class : 'RobotPublisher',
        outputPath : 'results/chrome',
        outputFileName : "output_chrome.xml",
        disableArchiveOutput : false,
        passThreshold : 100,
        unstableThreshold: 95.0,
        otherFiles : "*.png",
        logFileName: 'log_chrome.html', 
        reportFileName: 'report_chrome.html'
      ])


      archiveArtifacts artifacts: 'results/chrome/*.xml, results/chrome/*.html, results/chrome/*.png', fingerprint: true

      
      cleanWs()
    }
  }
}
