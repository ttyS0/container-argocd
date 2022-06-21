FROM quay.io/argoproj/argocd:v2.4.1
LABEL org.opencontainers.image.source="https://github.com/ttyS0/container-argocd"

USER root

RUN apt-get update && \
    apt-get install -y git-crypt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /usr/bin/git /usr/bin/git.bin
COPY git.sh /usr/bin/git
RUN chmod a+x /usr/bin/git

USER 999
