#!/bin/bash

# kill all containers of type yuvalif/echo
docker kill `docker ps -a |grep [yuvalif/echo] |awk '{print $1}'`

# kill namerd and linkerd-tcp
killall linkerd-tcp
killall namerd-1.0.2-exec 
