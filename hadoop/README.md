# HadoopHelloWorld

### Inspired from 
- https://github.com/sequenceiq/hadoop-docker

### Quick start (Docker)

```bash 

$ git clone https://github.com/yennanliu/HadoopHelloWorld.git
$ cd HadoopHelloWorld
$ docker build . -t hadoop_env
$ docker run -it hadoop_env /etc/bootstrap.sh -bash
# inside hadoop docker console 
# run the mapreduce
bash-4.1# bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'

# check the output
bash-4.1# bin/hdfs dfs -cat output/*


```

### Ref
- Hadoop env set up
	- https://medium.com/@sleo1104/hadoop-3-2-0-%E5%AE%89%E8%A3%9D%E6%95%99%E5%AD%B8%E8%88%87%E4%BB%8B%E7%B4%B9-22aa183be33a
- Hadoop command 
	- https://data-flair.training/blogs/top-hadoop-hdfs-commands-tutorial/