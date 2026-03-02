@Library('my-shared-library') _  // Lib from github

pipeline {
    agent any

    stages {
        stage('Test Shared Library') {
            steps {
                script {
                    // Function in Groovy
                    dockerBuild("test-app")
                }
            }
        }
    }
}