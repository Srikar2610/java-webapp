pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "java-webapp"
        DOCKER_CONTAINER = "tomcat_app"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Srikar2610/java-webapp.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                docker stop $DOCKER_CONTAINER || true
                docker rm $DOCKER_CONTAINER || true
                docker run -d --name $DOCKER_CONTAINER -p 8080:8080 $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}
