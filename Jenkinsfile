pipeline {
    agent {
        label 'windows-worker'
    }

    stages {
        stage('Version verification') {
            when {
                branch 'prod'
            }
            steps {
                bat 'ng version'
            }
        }

        stage('Install dependencies') {
            when {
                branch 'prod'
            }
            steps {
                bat 'npm install'
            }
        }

        stage('Lint tests') {
            when {
                branch 'prod'
            }
            steps {
                bat 'ng lint'
            }
        }

        stage('Unit Tests') {
            when {
                branch 'prod'
            }
            steps {
                bat 'ng test'
            }
        }

        stage('Build application') {
            when {
                branch 'prod'
            }
            steps {
                bat 'ng build'
            }
        }
    }
}
