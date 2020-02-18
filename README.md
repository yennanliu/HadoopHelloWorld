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
$ docker pull yennanliu/hadoop-stand-alone:v1
# docker images
$ docker run -it <IMAGE_ID>

```


## Development 
- `dev`

## Ref 
- [Hadoop course material Udemy](https://sundog-education.com/hadoop-materials/) - Udemy Hadoop course resources
- [Mrjob](https://mrjob.readthedocs.io/en/latest/) - write MapReduce jobs via python and running on several platforms
- [Ambari](https://docs.cloudera.com/HDPDocuments/Ambari-2.7.5.0/bk_ambari-installation/content/ch_Deploy_and_Configure_a_HDP_Cluster.html) - Apache Ambari Installation : Installing, Configuring, and Deploying a Cluster
