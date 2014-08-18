#!/bin/bash
WORKINGDIR=$1
CHOIX_TEST=$2
GITLOG=$(git log --pretty=format:'%h' -n 1)

################ Fonction pour les tests
reportGalaxyService()
{
    sleep 2m
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
    cp $WORKINGDIR/galaxy-roles-profiles/examples/sqlite-onecore.sample $WORKINGDIR/global.yaml
    sudo docker build -t galaxy/osqlite:$GITLOG $WORKINGDIR
}

#BUILD postgresql-onecore +/- apache
buildGalaxyapachesqlite ()
{
    cp $WORKINGDIR/galaxy-roles-profiles/examples/postgresql-onecore.sample $WORKINGDIR/global.yaml
    sudo docker build -t galaxy/opostgres:$GITLOG $WORKINGDIR
}
############

    if [ $CHOIX_TEST = "galaxy-sqlite" ]
    then
        buildGalaxysqlite
        sudo docker run -d --name galaxy-so -e "ROLE=galaxy-sqlite" -e "GLOG=paster.log" galaxy/osqlite:$GITLOG
        IPVM=$(sudo docker inspect galaxy-so | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-SQLITE Onecore >>" >> $WORKINGDIR/rapport-$GITLOG
        reportGalaxyService $IPVM 8080 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-apache-sqlite" ]
    then
        buildGalaxysqlite
        sudo docker run -d --name galaxy-aso -e "ROLE=galaxy-apache-sqlite" -e "GLOG=paster.log" galaxy/osqlite:$GITLOG
        IPVM=$(sudo docker inspect galaxy-aso | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-APACHE-SQLITE Onecore >>" >> $WORKINGDIR/rapport-$GITLOG
        reportGalaxyService $IPVM 8080 $WORKINGDIR
        reportGalaxyService $IPVM 8081 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-postgresql" ]
    then
        buildGalaxyapachesqlite
        sudo docker run -d --name galaxy-po -e "ROLE=galaxy-postgresql" -e "GLOG=paster.log" galaxy/opostgres:$GITLOG
        IPVM=$(sudo docker inspect galaxy-po | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-POSTGRESQL Onecore >>" >> $WORKINGDIR/rapport-$GITLOG
        reportGalaxyService $IPVM 8080 $WORKINGDIR

    elif [ $CHOIX_TEST = "galaxy-apache-postgresql" ]
    then
        buildGalaxyapachesqlite
        sudo docker run -d --name galaxy-apo -e "ROLE=galaxy-apache-postgresql" -e "GLOG=paster.log" galaxy/opostgres:$GITLOG
        IPVM=$(sudo docker inspect galaxy-apo | grep IPAddress | cut -d\" -f4)
        echo "<< GALAXY-APACHE-POSTGRESQL Onecore >>" >> $WORKINGDIR/rapport-$GITLOG
        reportGalaxyService $IPVM 8080 $WORKINGDIR
        reportGalaxyService $IPVM 8081 $WORKINGDIR
    fi

#sudo docker stop $(docker ps -a -q)
#sudo docker rm $(docker ps -a -q)
exit 0
