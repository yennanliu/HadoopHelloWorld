#!/bin/sh

# intall Java 8 
sudo apt-get install openjdk-8-jdk-headless -y


# install hadoop
export HADOOP_VERSION=hadoop-3.1.1

wget https://archive.apache.org/dist/hadoop/core/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz

tar -xzf $HOME/${HADOOP_VERSION}.tar.gz -C $HOME

export JAVA_HOME=$(find /usr/lib -name *java-8*)/jre
export HADOOP_HOME=$HOME/$HADOOP_VERSION
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin:$PATH

echo "export JAVA_HOME=${JAVA_HOME}" >> $HOME/.bashrc
echo "export HADOOP_HOME=${HADOOP_HOME}" >> $HOME/.bashrc
echo "export PATH=${PATH}" >> $HOME/.bashrc

echo "export JAVA_HOME=${JAVA_HOME}" > $HADOOP_HOME/etc/hadoop/hadoop-env.sh
declare -a envvars=(
        "HDFS_NAMENODE_USER"
        "HDFS_SECONDARYNODE_USER"
        "HDFS_DATANODE_USER"
        "YARN_RESSOURCEMANAGER_USER"
        "YARN_NODEMANAGER_USER"
)
for ev in "${envvars[@]}"; do
    echo "export ${ev}=${USER}" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
done
