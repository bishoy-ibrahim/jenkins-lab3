def call(String imageName, String dockerHubCredId) {
    stage('Build Docker Image') {
        sh "docker build -t ${imageName} ."
    }

    stage('Push Docker Image') {
        withCredentials([usernamePassword(credentialsId: dockerHubCredId, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
            sh """
                echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                docker push ${imageName}
                docker logout
            """
        }
    }
}

