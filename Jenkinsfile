pipeline {
  agent any
  stages {
    stage('initialize') {
      steps {
        sh '''export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
mvn clean

'''
      }
    }
    stage('Build') {
      steps {
        sh '''export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
mvn install'''
      }
    }
    stage('artifact archiving') {
      steps {
        archiveArtifacts 'target/*.war'
      }
    }
    stage('Creating and Uploading Docker image') {
      steps {
        sh './create_docker_image.sh'
      }
    }
    stage('Uploading the image to Docker Hub') {
      steps {
        sh '''docker login -u=idan1281 -p=01021981
docker push idan1281/petclinic:${JOB_NAME}${BUILD_NUMBER}
docker push idan1281/petclinic:latest'''
      }
    }
  }
}