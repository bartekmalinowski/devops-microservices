@Library('my-shared-library') _ 

pipeline {
    agent any

        environment {
        AWS_ACCOUNT_ID = "466825170375" // For future use secret key in Jenkins 
        REGION         = "eu-central-1"
        APP_NAME       = "moj-mikroserwis"
    }

    stages {
        stage('App Build') {
            steps {
                script {
                    dockerBuild(APP_NAME)
                }
            }
        }
        stage('Image Test') {
            steps {
                sh "docker run --rm ${APP_NAME}:latest"
            }
        }
        stage('Push to AWS ECR') {
            steps {
                script {
                    // ecrPush.groovy from my Lib
                    ecrPush(APP_NAME, AWS_ACCOUNT_ID, REGION)
                }
            }
        }
        stage('Deploy to K8s') {
            steps {
                String fullImageName = "${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${APP_NAME}:latest"
                    k8sDeploy(fullImageName, "k3s-config")
                }
            }
        }
    }