#!/bin/sh
# https://www.quora.com/Can-I-run-Hive-queries-from-Shell-Script
echo "create table..."
hive -e "CREATE TABLE pokes (foo INT, bar STRING);"
echo "load data..."
hive -e "LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;"
echo "query data..."
hive -e "SELECT * FROM pokes;"