FROM nicolaka/netshoot:latest

RUN apk add htop zfs inotify-tools && cp /usr/local/bin/calicoctl /calicoctl

ENV CALICO_CTL_CONTAINER=TRUE
ENV PATH=$PATH:/