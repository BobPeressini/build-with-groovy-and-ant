from openjdk:18-jdk-alpine3.13

RUN apk add --update bash

#Create Ant Dir
RUN mkdir -p /opt/ant/
#Download And 1.9.8
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -P /opt/ant
#Unpack Ant
RUN tar -xvzf /opt/ant/apache-ant-1.9.8-bin.tar.gz -C /opt/ant/
# Remove tar file
RUN rm -f /opt/ant/apache-ant-1.9.8-bin.tar.gz

#Install GIT
#RUN apk --update add git
#Install Curl
#RUN apk --update add curl
#Setting Ant Home
#ENV ANT_HOME=/opt/ant/apache-ant-1.9.8
#Setting Ant Params
#ENV ANT_OPTS="-Xms256M -Xmx512M"
#Updating Path
#ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"

#USER root
#RUN apt-get update -qq \
#    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
#RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
#RUN add-apt-repository \
#   "deb [arch=amd64] https://download.docker.com/linux/debian \
#   $(lsb_release -cs) \
#   stable"
#RUN apt-get update  -qq \
#    && apt-get install docker-ce -y
#RUN usermod -aG docker jenkins
#FROM openjdk:8
#ADD target/java-jenkins-docker.jar java-jenkins-docker.jar
#ENTRYPOINT ["java", "-jar","java-jenkins-docker.jar"]
#EXPOSE 8080

ENTRYPOINT sleep infinity