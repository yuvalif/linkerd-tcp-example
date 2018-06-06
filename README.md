# linkered-tcp example
## Background
linkered-tcp is a TCP proxy useed by the [linkerd](https://linkerd.io/) service mesh network. This example is using it as a standalone TCP proxy, without the rest of the linkerd functions.
The only other function which is needed is [namerd](https://linkerd.io/advanced/namerd/) which is used for service discovery. In our test, service discovery is not needed, and the mapping between the service and its address is done staticaly. However, the namerd function is still mandatory for the linkerd-tcp process.
## Prerequisites
Following things needs to be installed on the machine:
* ```rust```: linkerd-tcp is implemented in [rust](https://www.rust-lang.org/en-US/)
* ```cargo```: build and dependency tool for rust
* ```docker```: the echo server runs inside docker
* ```java```: namerd (as well as rest of linkerd) is implemented in scala
## Installation
Run ```./get-linkerd.sh```, this will clone the linkerd-tcp repo, and build it using ``cargo``, and then will download namerd.
## Setup
Run ```./setup.sh``` to start namerd, linkerd-tcp and a docker container running a TCP echo server
## Teardown
Run ```./setup.sh``` to stop namerd, linkerd-tcp and the docker container
## Test
Run ```nc 127.0.0.1 5555``` to see that the server works via the proxy. To check that it works by itself use: ```nc 127.0.0.1 5556```
## namerd
Note that file based namer is configured in the system (```io.l5d.fs``` using the ```disco``` directory), however, the directory is empty, and the mapping between the echo service and its actual IP/port (127.0.0.1:5556) is done statically in ```namerd.yml```
