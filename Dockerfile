FROM fedora:27
RUN dnf install -y java

COPY linkerd-tcp/target/namerd-1.0.2-exec /
COPY linkerd-tcp/target/debug/linkerd-tcp / 
COPY linkerd-tcp.yml namerd.yml / 
COPY entry-point.sh / 

ENTRYPOINT [ "/entry-point.sh" ]
