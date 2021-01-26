FROM calico/ctl:v3.17.1 as calicoctl

FROM nicolaka/netshoot:latest

COPY --from=calicoctl /calicoctl /calicoctl

ENV CALICO_CTL_CONTAINER=TRUE
ENV PATH=$PATH:/