FROM openjdk:18-jdk-alpine3.13

RUN apk add --update bash

ENV ANT_VERSION 1.9.8
RUN cd && \
    wget -q http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin
RUN ant -version

ENV GROOVY_VERSION=3.0.9
RUN cd && \
    wget https://archive.apache.org/dist/groovy/3.0.9/distribution/apache-groovy-binary-$GROOVY_VERSION.zip && \
    unzip apache-groovy-binary-$GROOVY_VERSION.zip && \
    mv groovy-$GROOVY_VERSION /opt/groovy && \
    rm apache-groovy-binary-$GROOVY_VERSION.zip
ENV GROOVY_HOME /opt/groovy
ENV PATH ${PATH}:/opt/groovy/bin
RUN groovy -version

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