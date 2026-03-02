@Library('my-shared-library') _ 

pipeline {
    agent any

    stages {
        stage('App Build') {
            steps {
                script {
                    dockerBuild("my-mikroservice")
                }
            }
        }
        stage('Image Test') {
            steps {
                sh "docker run --rm my-mikroservice:latest"
            }
        }
    }
}