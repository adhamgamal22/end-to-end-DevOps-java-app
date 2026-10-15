pipeline {
    agent any

    environment {
        IMAGE_NAME = 'adhamgamal74/java-app'
    }

    stages {
        stage('Docker Build') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    docker build \
                      -t ${IMAGE_NAME}:v1.0-${BUILD_NUMBER} .
                '''
            }
        }

        stage('Docker Hub Push') {
            when {
                branch 'main'
            }
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh '''
                        set +x

                        echo "$DOCKER_PASS" |
                          docker login \
                          -u "$DOCKER_USER" \
                          --password-stdin

                        docker push \
                          ${IMAGE_NAME}:v1.0-${BUILD_NUMBER}

                        docker logout
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when {
                branch 'main'
            }
            steps {
         sh '''
    set -e

    sed -i \
      "s|image:.*|image: ${IMAGE_NAME}:${IMAGE_TAG}|" \
      deploy.yml

    kubectl apply -f deploy.yml
    kubectl apply -f service.yml

    kubectl rollout status \
      deployment/my-app1-deployment \
      --timeout=120s
'''
            }
        }
    }

    post {
        success {
            echo "Pipeline succeeded for ${env.BRANCH_NAME}"
        }

        failure {
            echo "Pipeline failed for ${env.BRANCH_NAME}"
        }
    }
}
