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
                script { 
                    if (env.BRANCH_NAME != 'dev' && env.BRANCH_NAME != 'prod') {
                        bat "echo move %CD%\dist\clase-6 C:\inetpub\wwwroot\marco\env.BRANCH_NAME"
                        bat "move %CD%\dist\clase-6 C:\inetpub\wwwroot\marco\env.BRANCH_NAME"
                    } else {
                        bat "echo do nothing."
                    }
                }
           }
            
        }
    }
}
