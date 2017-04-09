pipeline {
  agent any
  stages {
    stage('initialize') {
      steps {
        sh '''echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
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
  }
}