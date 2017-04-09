pipeline {
  agent any
  stages {
    stage('initialize') {
      steps {
        sh '''echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
source /etc/environment
mvn clean

'''
      }
    }
    stage('Build') {
      steps {
        sh 'mvn install'
      }
    }
    stage('artifact archiving') {
      steps {
        archiveArtifacts 'target/*.war'
      }
    }
    stage('Creating Docker image') {
      steps {
        sh './create_docker_image.sh'
      }
    }
  }
}