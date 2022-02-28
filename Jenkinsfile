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

         stage('Deploy') {

             when {
                 branch 'prod'
             }
        
            steps {
               bat '"move %CD%/dist/clase6 C:/inetpub/wwwroot/marco/env.BRANCH_NAME"'
           }
            
        }
    }
}
