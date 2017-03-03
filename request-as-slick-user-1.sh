#!/bin/bash


if [ ! -e auth/slick-user-1 ]
then
	./auth_slick_user_1.sh
fi

AGE_OF_TOKEN=$(( `date +%s` - `date -r auth/slick-user-1 +%s` ))

if [ $AGE_OF_TOKEN -gt 300 ]
then
	./auth_slick_user_1.sh
fi

TOKEN=`cat auth/slick-user-1`

curl -H "Authorization: Bearer $TOKEN" "$@"
