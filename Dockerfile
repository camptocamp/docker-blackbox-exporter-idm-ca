ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/blackbox_exporter  /bin/blackbox_exporter
COPY config/blackbox_server.yml       /etc/blackbox_exporter/config.yml
COPY ca/idm-ca.crt       /usr/local/share/ca-certificates/idm.c2c.com-ca.crt

EXPOSE      9115
ENTRYPOINT  [ "/bin/blackbox_exporter" ]
CMD         [ "--config.file=/etc/blackbox_exporter/config.yml" ]