pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        echo 'Building'
        sh 'mvn clean install'
      }
    }
    stage('create docker image') {
      steps {
        sh './create_docker_image.sh'
      }
    }
  }
}
