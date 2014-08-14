#!/bin/bash

DIRVM="/home/sbridel/workspace/docker"
GITLOG=$(git log --pretty=format:'%h' -n 1)

#BUILD n*3 : sqlite-multicore +/-apache

cp $DIRVM/galaxy-roles-profiles/examples/sqlite-multicore.sample $DIRVM/global.yaml
sudo docker build -t galaxy/msqlite:$GITLOG $DIRVM

###INSTANCE 5
##ROLE GALAXY-SQLITE
sudo docker run -d --name galaxy-sm -e "ROLE=galaxy-sqlite" -e "GLOG=web0.log" galaxy/msqlite:$GITLOG
IPVM_array[0]=$(sudo docker inspect galaxy-sm | grep IPAddress | cut -d\" -f4)

###INSTANCE 6
##ROLE GALAXY-APACHE-SQLITE
sudo docker run -d --name galaxy-asm -e "ROLE=galaxy-apache-sqlite" -e "GLOG=web0.log" galaxy/msqlite:$GITLOG
IPVM_array[1]=$(sudo docker inspect galaxy-asm | grep IPAddress | cut -d\" -f4)

#BUILD n*4 postgresql-onecore +/- apache

#cp $DIRVM/galaxy-roles-profiles/examples/postgresql-multicore.sample $DIRVM/global.yaml
#sudo docker build -t galaxy/mpostgres:$GITLOG $DIRVM

###INSTANCE 7
##ROLE GALAXY-POSTGRESQL/INSTANCE 3
#sudo docker run -d --name galaxy-pm -e "ROLE=galaxy-postgresql" -e "GLOG=web0.log" galaxy/mpostgres:$GITLOG
#IPVM_array[6]=$(sudo docker inspect galaxy-pm | grep IPAddress | cut -d\" -f4)

###INSTANCE 8
##ROLE GALAXY-POSTGRESQL-APACHE
#sudo docker run -d --name galaxy-apm -e "ROLE=galaxy-apache-postgresql" -e "GLOG=web0.log" galaxy/mpostgres:$GITLOG
#IPVM_array[7]=$(sudo docker inspect galaxy-apm | grep IPAddress | cut -d\" -f4)
#echo ${IPVM_array[@]}

