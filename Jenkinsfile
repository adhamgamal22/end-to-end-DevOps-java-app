pipeline {
    agent any

    environment {
        IMAGE_NAME = 'adhamgamal74/java-app'
    }

    stages {

        stage('Build') {
            steps {
                sh './mvnw -B clean package -DskipTests'
            }
        }


        stage('Docker Build') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    docker build \
                      -t ${IMAGE_NAME}:v1.0-${BUILD_NUMBER} .                '''
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

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    docker rm -f my-app || true

                    docker run -d \
                      --name my-app \
                      --restart unless-stopped \
                      -p 8082:8080 \
                      ${IMAGE_NAME}:v1.0-${BUILD_NUMBER}
                '''
            }
        }
    }
}
