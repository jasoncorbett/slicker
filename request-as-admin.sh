#!/bin/bash


if [ ! -e auth/admin ]
then
	./auth_admin.sh
fi

AGE_OF_TOKEN=$(( `date +%s` - `date -r auth/admin +%s` ))

if [ $AGE_OF_TOKEN -gt 300 ]
then
	./auth_admin.sh
fi

TOKEN=`cat auth/admin`

curl -H "Authorization: Bearer $TOKEN" "$@"
