# Hadoop Java

### Prerequisite
- Install stand alone Hadoop on Mac
- Please do update configs
- Please format namenode aftert
- https://towardsdatascience.com/installing-hadoop-on-a-mac-ec01c67b003c

### Commands
```bash
# 1) hadoop files
cd /usr/local/cellar/hadoop/3.3.0/libexec/etc/hadoop

# 2) run all services
cd /usr/local/cellar/hadoop/3.3.0/libexec/sbin
./start-all.sh
jps

# 3) stop all services
cd /usr/local/cellar/hadoop/3.3.0/libexec/sbin
./stop-all.sh
jps

### 4) Re-run
stop-all.sh
hadoop namenode -format
start-all.sh
```

- Endpoints (local)
	- Namenode : http://localhost:9870/
	- Yarn UI : http://localhost:8042
	- Resource Manager (RM), Node Manager : http://localhost:8088

- Config local hadoop
	- https://towardsdatascience.com/installing-hadoop-on-a-mac-ec01c67b003c
