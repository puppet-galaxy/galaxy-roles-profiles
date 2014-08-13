#!/bin/bash

DIRVM="/home/sbridel/workspace/docker"
GITLOG=$(git log --pretty=format:'%h' -n 1)

#BUILD n*1 : sqlite-onecore +/-apache

cp $DIRVM/galaxy-roles-profiles/examples/sqlite-onecore.sample $DIRVM/global.yaml
sudo docker build -t galaxy/osqlite:$GITLOG $DIRVM

###INSTANCE 1
##ROLE GALAXY-SQLITE
sudo docker run -d --name galaxy-so -e "ROLE=galaxy-sqlite" -e "GLOG=paster.log" galaxy/osqlite:$GITLOG
IPVM_array[0]=$(sudo docker inspect galaxy-so | grep IPAddress | cut -d\" -f4)

###INSTANCE 2
##ROLE GALAXY-APACHE-SQLITE
sudo docker run -d --name galaxy-aso -e "ROLE=galaxy-apache-sqlite" -e "GLOG=paster.log" galaxy/osqlite:$GITLOG
IPVM_array[1]=$(sudo docker inspect galaxy-aso | grep IPAddress | cut -d\" -f4)

#BUILD n*2 postgresql-onecore +/- apache

cp $DIRVM/galaxy-roles-profiles/examples/postgresql-onecore.sample $DIRVM/global.yaml
sudo docker build -t galaxy/opostgres:$GITLOG $DIRVM

###INSTANCE 3
##ROLE GALAXY-POSTGRESQL/INSTANCE 3
sudo docker run -d --name galaxy-po -e "ROLE=galaxy-postgresql" -e "GLOG=paster.log" galaxy/opostgres:$GITLOG
IPVM_array[2]=$(sudo docker inspect galaxy-po | grep IPAddress | cut -d\" -f4)

###INSTANCE 4
##ROLE GALAXY-POSTGRESQL-APACHE
sudo docker run -d --name galaxy-apo -e "ROLE=galaxy-apache-postgresql" -e "GLOG=paster.log" galaxy/opostgres:$GITLOG
IPVM_array[3]=$(sudo docker inspect galaxy-apo | grep IPAddress | cut -d\" -f4)
