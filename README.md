<h1 align="center">HADOOP-HELLO-WORLD</h1>
<h4 align="center">Basic commands/applications on Apche Hadoop ecosystem </h4>

## Relative Projects

* [spark_emr_dev](https://github.com/yennanliu/spark_emr_dev) - Demo of submitting Hadoop ecosystem jobs to AWS EMR
* [spark-etl-pipeline](https://github.com/yennanliu/spark-etl-pipeline) - Demo of various Spark ETL processes
* [utility_Scala](https://github.com/yennanliu/utility_Scala) - Scala/Spark programming basic demo 

## Main Covers 
 
- Hadoop stand-alone 
- Hadoop hive
- Hadoop Spark  
- Hadoop demo scripts 

## Quick Start (Manually)

```bash
# run mrjob demo 
$ python hadoophelloworld/my_word_count.py README.md 

# run RatingsBreakdown
$ python hadoophelloworld/RatingsBreakdown.py data/ml-100k/u.data

```

## Quick Start (Docker)

```bash
# hadoop-stand-alone
$ docker pull yennanliu/hadoop-stand-alone:v1
# docker images
$ docker run -it <IMAGE_ID>

```

```bash
# hadoop-pig
$ bash hadoop-pig/quick_start.sh

```

## Development

- Culster-managment 
- Trouble-shooting
- Unit-test
- Dev-op

## TODO 

<details>
<summary>TODO</summary>

- Build hadoop from `AWS EC2` from scratch 
- Build hadoop from `local` from scratch 

</details>

## Ref 

<details>
<summary>TODO</summary>

- [Hadoop course material Udemy](https://sundog-education.com/hadoop-materials/) - Udemy Hadoop course resources
- [Mrjob](https://mrjob.readthedocs.io/en/latest/) - write MapReduce jobs via python and running on several platforms
- [Ambari](https://docs.cloudera.com/HDPDocuments/Ambari-2.7.5.0/bk_ambari-installation/content/ch_Deploy_and_Configure_a_HDP_Cluster.html) - Apache Ambari Installation : Installing, Configuring, and Deploying a Cluster

- Install Hadoop from scratch (AWS)
	- https://medium.com/nibbleai/install-a-hadoop-cluster-on-aws-ec2-8c40dac490e
	- https://dzone.com/articles/deep-dive-into-apache-flinks-tumblingwindow
	- https://www.edureka.co/blog/install-apache-hadoop-cluster/
	- https://blog.gaelfoppolo.com/lets-try-hadoop-on-aws-13a23e641490
	- https://blog.insightdatascience.com/spinning-up-a-free-hadoop-cluster-step-by-step-c406d56bae42

</details>