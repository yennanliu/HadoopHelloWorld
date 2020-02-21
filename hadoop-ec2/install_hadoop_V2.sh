#!/bin/sh

export HADOOP_VERSION=hadoop-2.8.2


sudo apt-get install default-jdk -y 
wget https://archive.apache.org/dist/hadoop/core/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz
sudo tar xzf ${HADOOP_VERSION}.tar.gz 
sudo mv ${HADOOP_VERSION} /usr/local/hadoop
sudo chown -R ubuntu /usr/local/hadoop/

# Hadoop configuration
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >>  ~/.profile
echo "export PATH={"PATH:JAVA_HOME/bin"}" >>  ~/.profile
echo "export HADOOP_HOME=/usr/local/hadoop"  >> ~/.profile 
echo "export PATH=PATH:HADOOP_HOME/bin"  >> ~/.profile

# hadoop-env.sh
echo "export JAVA_HOME=${JAVA_HOME}" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh
