pipeline {
  agent any
  stages {
    stage('Clone git Repo') {
      steps {
        git(poll: true, branch: 'master', changelog: true, url: 'https://github.com/idan1281/pet2', credentialsId: 'idan1281@gmail.com')
      }
    }
    stage('Maven Clean Install') {
      steps {
        sh '/opt/maven/bin/mvn clean install'
        stash '*.war'
      }
    }
    stage('Build status') {
      steps {
        echo 'Build finished succesfully'
      }
    }
    stage('archive artifatct') {
      steps {
        archiveArtifacts(artifacts: '*.war', allowEmptyArchive: true)
      }
    }
  }
}