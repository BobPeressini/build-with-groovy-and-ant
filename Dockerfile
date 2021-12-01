FROM openjdk:8-jdk-alpine

#/app # cat /etc/os-release
#NAME="Alpine Linux"
#ID=alpine
#VERSION_ID=3.9.4
#PRETTY_NAME="Alpine Linux v3.9"
#HOME_URL="https://alpinelinux.org/"
#BUG_REPORT_URL="https://bugs.alpinelinux.org/"

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

