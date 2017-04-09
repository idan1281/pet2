pipeline {
  agent {
    docker {
      image 'maven:3.3.9-jdk-7'
    }
    
  }
  stages {
    stage('initialize') {
      steps {
        sh '''echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
mvn clean
sudo usermod -aG docker $(whoami)
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
  }
}