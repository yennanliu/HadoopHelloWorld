#!/bin/sh

git clone https://github.com/yennanliu/HadoopHelloWorld.git
docker pull ipedrazas/hadoop-pig
docker run  --mount \
type=bind,\
source="$(pwd)"/.,\
target=/HadoopHelloWorld \
-i -t ipedrazas/hadoop-pig /bin/bash -c " ./etc/bootstrap.sh && mv HadoopHelloWorld/HadoopHelloWorld/data data && pig -x local"
