#!/bin/bash

# init mariadb
/usr/local/bin/docker-entrypoint.sh mariadbd &

sleep 30

# start app
if [ -f /app/_start.sh ] ; then
	/app/_start.sh
fi
