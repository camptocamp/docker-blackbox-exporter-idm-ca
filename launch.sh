#!/bin/sh

mkdir /etc/blackbox_exporter/

rm -f /etc/blackbox_exporter/config.yml || :
envsubst < config.yml > /etc/blackbox_exporter/config.yml

rm -f /etc/blackbox_exporter/config_web.yml || :
envsubst < config_web.yml > /etc/blackbox_exporter/config_web.yml

if [[ -z "${APP_LOG_LEVEL}" ]]; then
  LOG_LEVEL="info"
  LOG_PROBER="info"
else
  LOG_LEVEL="${APP_LOG_LEVEL}"
  LOG_PROBER="${APP_LOG_LEVEL}"
fi

/bin/blackbox_exporter --log.level=${LOG_LEVEL} --log.prober=${LOG_PROBER} --config.file=/etc/blackbox_exporter/config.yml --web.config.file=/etc/blackbox_exporter/config_web.yml
