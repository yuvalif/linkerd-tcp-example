#!/bin/bash

# kill all containers of type yuvalif/echo
CONTAINER=`docker ps -a | grep [yuvalif/echo] |awk '{print $1}'`
if [[ ! $CONTAINER = "" ]]; then
	docker kill $CONTAINER
fi

# kill namerd and linkerd-tcp
pkill linkerd-tcp
pkill namerd-1.0.2-exec 
pkill java
