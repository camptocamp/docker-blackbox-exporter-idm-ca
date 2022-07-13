FROM alpine:3.16.0

RUN apk add --no-cache gettext

COPY bin/blackbox_exporter /bin/blackbox_exporter
COPY ca/idm-ca.crt /usr/local/share/ca-certificates/idm.c2c.com-ca.crt
COPY config/blackbox_server.yml ./config.yml
COPY config/blackbox_server_web.yml ./config_web.yml
COPY launch.sh ./

RUN chmod +x ./launch.sh

EXPOSE 9115
CMD ["./launch.sh"]
