#!/bin/bash

#create the Dockerfile on /tmp/docker
mkdir -p /tmp/docker
cp /var/lib/jenkins/.m2/repository/org/springframework/samples/spring-petclinic/1.0.3-SNAPSHOT/*.war /tmp/docker/petclinic.war
cat <<EOF > /tmp/docker/Dockerfile
FROM tomcat:8.0
MAINTAINER "idan mishor <Idan1281@gmail.com>"/
ADD *.war /usr/local/tomcat/webapps/
EOF

# create the docker image
cd /tmp/docker
#docker build -t idan1281/petclinic:${JOB_NAME}${BUILD_NUMBER}  -t idan1281/petclinic:latest .
docker build -t "idan1281/petclinic:${BUILD_NUMBER}"  -t idan1281/petclinic:latest .


