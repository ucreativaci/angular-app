pipeline {
    agent {
        label "windows-worker"
    }

    stages {
        stage('Ng Version') {
            steps {
               bat "ng version"
            }
        }

         stage('Install Dependencies') {
            steps {
               bat "npm install"
            }
        }

        stage('Lint') {
            steps {
               bat "ng lint "
            }
        }

        stage('Test') {
            steps {
               bat "ng test"
            }
        }

        stage('Build') {
            steps {
               bat "ng build"
            }
        }

         stage('Deploy to dev') {

             when {branch 'dev' }
        
            steps {
                bat 'xcopy dist\\clase6 C:\\inetpub\\wwwroot\\marco\\dev /s /y'
           }
            
        }

          stage('Deploy to prod') {

             when {branch 'prod' }
        
            steps {
                bat "xcopy dist\\clase6 C:\\inetpub\\wwwroot\\marco\\prod /s /y"
           }
            
        }
    }
}
