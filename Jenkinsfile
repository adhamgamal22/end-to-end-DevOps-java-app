pipeline {
    agent any
    
      tools {
        maven 'maven3'
    }
    
    environment {
        IMAGE_NAME = 'adhamgamal74/java-app'
    }

    stages {
        stage('Build & Test') {
            steps {
                sh 'mvn -B clean test'
            }
        }

        stage('Docker Build') {
            when { branch 'main' }
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Docker Hub Push') {
            when { branch 'main' }
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}
                        docker logout
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when { branch 'main' }
            steps {
                sh '''
                    kubectl rollout restart deployment/my-app1-deployment
                    kubectl rollout status deployment/my-app1-deployment --timeout=120s
                '''
            }
        }
    }

    post {
        success { echo "Pipeline succeeded for ${env.BRANCH_NAME}" }
        failure { echo "Pipeline failed for ${env.BRANCH_NAME}" }
    }
}
