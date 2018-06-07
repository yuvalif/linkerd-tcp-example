#!/bin/bash

# run namerd
mkdir -p disco
/namerd-1.0.2-exec namerd.yml #> ./namerd.log 2>&1 &

# run linkerd-tcp and block
/linkerd-tcp linkerd-tcp.yml #> ./linkerd-tcp.log 2>&1

