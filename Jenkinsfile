pipeline {
  agent any
  stages {
    stage('initialize') {
      steps {
        sh '''echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
mvn clean

'''
        withMaven(jdk: '/usr/lib/jvm/java-8-openjdk-amd64/jre')
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