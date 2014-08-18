#!/bin/bash

WORKINGDIR=$1
CHOIX_TEST=$2
GITLOG=$(git log --pretty=format:'%h' -n 1)

################ Fonction pour les tests
reportGalaxyService()
{
    if [ $(curl $1:$2 | grep -c welcome ) -ge 1 ]
    then
        echo $1":"$2" is working" >> $3/rapport-$GITLOG
    else
        echo $1":"$2" is broken" >> $3/rapport-$GITLOG
    fi
}
#BUILD sqlite-onecore +/-apache
buildGalaxysqlite()
{
    cp $WORKINGDIR/galaxy-roles-profiles/examples/sqlite-multicore.sample $WORKINGDIR/global.yaml
    sudo docker build -t galaxy/msqlite:$GITLOG $WORKINGDIR
}

#BUILD postgresql-onecore +/- apache
buildGalaxypostgresql ()
{
    cp $WORKINGDIR/galaxy-roles-profiles/examples/postgresql-multicore.sample $WORKINGDIR/global.yaml
    sudo docker build -t galaxy/mpostgres:$GITLOG $WORKINGDIR
}
############
    if [ $CHOIX_TEST = "galaxy-sqlite" ]
    then
        buildGalaxysqlite
        sudo docker run -d --name galaxy-sm -e "ROLE=galaxy-sqlite" -e "GLOG=web0.log" galaxy/msqlite:$GITLOG
        IPVM=$(sudo docker inspect galaxy-sm | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-SQLITE Multicore >>" >> $WORKINGDIR/rapport-$GITLOG
        sleep 2m
        reportGalaxyService $IPVM 8000 $WORKINGDIR
        reportGalaxyService $IPVM 8001 $WORKINGDIR
        reportGalaxyService $IPVM 8002 $WORKINGDIR
        reportGalaxyService $IPVM 8003 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-apache-sqlite" ]
    then
        buildGalaxysqlite
        sudo docker run -d --name galaxy-asm -e "ROLE=galaxy-sqlite" -e "GLOG=web0.log" galaxy/msqlite:$GITLOG
        IPVM=$(sudo docker inspect galaxy-asm | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-APACHE-SQLITE Multicore >>" >> $WORKINGDIR/rapport-$GITLOG
        sleep 2m
        reportGalaxyService $IPVM 8000 $WORKINGDIR
        reportGalaxyService $IPVM 8001 $WORKINGDIR
        reportGalaxyService $IPVM 8002 $WORKINGDIR
        reportGalaxyService $IPVM 8003 $WORKINGDIR
        reportGalaxyService $IPVM 8081 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-postgresql" ]
    then
        buildGalaxypostgresql
        sudo docker run -d --name galaxy-pm -e "ROLE=galaxy-postgresql" -e "GLOG=web0.log" galaxy/mpostgres:$GITLOG
        IPVM=$(sudo docker inspect galaxy-pm | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-POSTGRESQL Multicore >>" >> $WORKINGDIR/rapport-$GITLOG
        sleep 4m
        reportGalaxyService $IPVM 8000 $WORKINGDIR
        reportGalaxyService $IPVM 8001 $WORKINGDIR
        reportGalaxyService $IPVM 8002 $WORKINGDIR
        reportGalaxyService $IPVM 8003 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-apache-postgresql" ]
    then
        buildGalaxypostgresql
        sudo docker run -d --name galaxy-apm -e "ROLE=galaxy-apache-postgresql" -e "GLOG=web0.log" galaxy/mpostgres:$GITLOG
        IPVM=$(sudo docker inspect galaxy-apm | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-APACHE-POSTGRESQL Multicore >>" >> $WORKINGDIR/rapport-$GITLOG
        sleep 2m
        reportGalaxyService $IPVM 8000 $WORKINGDIR
        reportGalaxyService $IPVM 8001 $WORKINGDIR
        reportGalaxyService $IPVM 8002 $WORKINGDIR
        reportGalaxyService $IPVM 8003 $WORKINGDIR
        reportGalaxyService $IPVM 8081 $WORKINGDIR
    fi
#sudo docker stop $(docker ps -a -q)
#sudo docker rm $(docker ps -a -q)
exit 0
