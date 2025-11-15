pipeline {
    agent any

    parameters {
        string(name: 'NAME', defaultValue: 'World', description: 'Name parameter')
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Running on: ${env.NODE_NAME}"
                echo "Workspace: ${env.WORKSPACE}"
                checkout scm
            }
        }

        stage('Run Script') {
            steps {
                sh 'chmod +x scripts/hello.sh'
                sh 'scripts/hello.sh "${NAME}" > output.txt'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'output.txt', fingerprint: true
            }
        }
    }
}

