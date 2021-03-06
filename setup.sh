#!/bin/bash

# run the server
docker run --rm -d -p 5556:5555 yuvalif/echo

# run namerd
mkdir -p disco
linkerd-tcp/target/namerd-1.0.2-exec namerd.yml > ./namerd.log 2>&1 &

# run linkerd-tcp
linkerd-tcp/target/debug/linkerd-tcp linkerd-tcp.yml > ./linkerd-tcp.log 2>&1 &

