#!/bin/bash

ROOTDIR=`dirname $0`
cd "${ROOTDIR}"
ROOTDIR=`pwd`

if [ ! -e docker-compose-dev.yml ];
then
	cp dev-env/docker-compose-dev.yml ./
fi

cd dev-env

for TEMPLATE in *.template.*;
do
	REAL_CONF=`echo $TEMPLATE |perl -pe 's/\.template\.//'`
	if [ ! -e "$REAL_CONF" ]
	then
		cp "$TEMPLATE" "$REAL_CONF"
	fi
done

for MOUNTED_DIR in logs data/mongo data/keycloak;
do
	if [ ! -d "$MOUNTED_DIR" ];
	then
		mkdir -p "$MOUNTED_DIR"
		chmod ga+rwx "$MOUNTED_DIR"
	fi
done

cd "$ROOTDIR"
docker-compose -f docker-compose-dev.yml up
