FROM nicolaka/netshoot:latest

RUN apk add --update --no-cache \
    tree htop zfs \
    gettext rsync \
    inotify-tools \
    openvpn \
    \
    && \
    cp /usr/local/bin/calicoctl /calicoctl

ENV CALICO_CTL_CONTAINER=TRUE
ENV PATH=$PATH:/