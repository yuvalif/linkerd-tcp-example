#!/bin/bash

# get linkerd-tcp and build it
git clone https://github.com/linkerd/linkerd-tcp.git
cd linkerd-tcp
cargo build
cd -

# get namerd
version="1.0.2"
bin="linkerd-tcp/target/namerd-${version}-exec"
url="https://github.com/linkerd/linkerd/releases/download/${version}/namerd-${version}-exec"

if [ ! -f "$bin" ]; then
  echo "downloading $bin" >&2
  curl -L --silent --fail -o "$bin" "$url"
  chmod 755 "$bin"
fi

