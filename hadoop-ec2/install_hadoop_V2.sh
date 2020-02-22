#!/bin/sh

# 1) declare env var
export HADOOP_VERSION=hadoop-2.8.2

# 2) prerequisite
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install default-jdk -y 
sudo apt install openjdk-8-jre-headless -y 

# 3) install hadoop 
mkdir hadoopdata
wget https://archive.apache.org/dist/hadoop/core/${HADOOP_VERSION}/${HADOOP_VERSION}.tar.gz
sudo tar xzf ${HADOOP_VERSION}.tar.gz 
sudo mv ${HADOOP_VERSION} /usr/local/hadoop
sudo chown -R ubuntu /usr/local/hadoop/

export HADOOP_HOME=/home/ubuntu/{HADOOP_VERSION}
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# 4) update ~/.bashrc
echo "export HADOOP_HOME=/home/ubuntu/{HADOOP_VERSION}"  >> ~/.bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native"  >> ~/.bashrc
echo "export HADOOP_OPTS={"-Djava.library.path=$HADOOP_HOME/lib"}"  >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle"  >> ~/.bashrc
echo "PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"  >> ~/.bashrc

source ~/.bashrc

# 5) Setting hadoop environment for password less ssh access
ssh-keygen -t rsa -P ''
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys

# 6) update sshd_config 
# /etc/ssh/sshd_config
# PasswordAuthentication yes

# 7) restart bash
sudo service ssh restart
ssh localhost
exit

# 8) git clone code 
git clone https://github.com/yennanliu/HadoopHelloWorld.git

# 8) update core-site.xml
mv HadoopHelloWorld/hadoop-ec2/core-site.xml /home/ubuntu/hadoop-2.7.3/etc/hadoop/

# 9) update hadoop-env.sh
mv HadoopHelloWorld/hadoop-ec2/hadoop-env.sh /home/ubuntu/hadoop-2.7.3/etc/hadoop/

# 10) update yarn-site.xml
mv HadoopHelloWorld/hadoop-ec2/yarn-site.xml /home/ubuntu/hadoop-2.7.3/etc/hadoop/

# 11) update hdfs-site.xml
mv HadoopHelloWorld/hadoop-ec2/hdfs-site.xml /home/ubuntu/hadoop-2.7.3/etc/hadoop/

# 12) update mapred-site.xml
mv HadoopHelloWorld/hadoop-ec2/mapred-site.xml /home/ubuntu/hadoop-2.7.3/etc/hadoop/

# 13) format HDFS (init)
hdfs namenode -format

# 14) start dfs, yarn
bash /home/ubuntu/{HADOOP_VERSION}/sbin/start-dfs.sh
bash /home/ubuntu/{HADOOP_VERSION}/sbin/start-yarn.sh

# 15) check hadoop processes /daemons running on hadoop
jps 

# 16) stop dfs, yarn
bash /home/ubuntu/{HADOOP_VERSION}/sbin/start-dfs.sh
bash /home/ubuntu/{HADOOP_VERSION}/sbin/start-yarn.sh
