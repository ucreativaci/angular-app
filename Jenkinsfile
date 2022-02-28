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
        
            steps {
               bat "echo Deplyoing"
           }
            
        }
    }
}
