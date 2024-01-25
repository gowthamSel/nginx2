
pipeline {
    agent any

    stages {
        stage('Remove Existing Containers') {
            steps {
                script {
                    try {
                        // Remove existing containers
                        // sh "docker rm -f \$(docker ps -q)"
                        echo "Containers removed successfully"
                    } catch (Exception e) {
                        echo "No running containers to remove"
                    }
                }
            }
        }

        stage('Build and Test') {
            environment {
                DOCKER_IMAGE_NAME = 'docker-imageone'
                DOCKER_IMAGE_TAG = 'latest'
                HOST_PORT = 8045
                CONTAINER_PORT = 80
            }

            steps {
                script {
                    // Build Docker image
                    sh "docker build . -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
                script {
                    // Run Docker container
                    //sh "docker run -itd -p ${HOST_PORT}:${CONTAINER_PORT} -v /proc:/host/proc:ro -v /etc:/host/etc:ro  ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                    sh "docker run  -itd -p ${HOST_PORT}:${CONTAINER_PORT} -v /etc/localtime:/etc/localtime:ro ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} "
                    // sh "docker run  -itd -p ${HOST_PORT}:${CONTAINER_PORT} ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }

    }
}
