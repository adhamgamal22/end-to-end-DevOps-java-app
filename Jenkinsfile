pipeline {
    agent any
    
    stages {
        stage('build') {
            steps {                
                sh "docker build -t adhamgamal74/my-app-java:V1.0:${env.BUILD_NUMBER} ."
                
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'dockerUser')]) {
                    sh "docker login -u '${dockerUser}' -p '${pass}'"
                    sh "docker push adhamgamal74/my-app-java:V1.0:${env.BUILD_NUMBER}"
                }
            }
        }
        
        stage('deploy') {
            steps {
                sh "docker run -d -p 400${env.BUILD_NUMBER}:5000 adhamgamal74/my-app-java:V1.0:${env.BUILD_NUMBER} "
            }
        }
    }    
}
