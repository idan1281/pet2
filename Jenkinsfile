pipeline {
  agent any
  stages {
    stage('') {
      steps {
        echo 'Starting the build'
      }
    }
    stage('build') {
      steps {
        git(poll: true, branch: 'master', changelog: true, url: 'https://github.com/idan1281/pet2', credentialsId: 'idan1281@gmail.com')
      }
    }
  }
}