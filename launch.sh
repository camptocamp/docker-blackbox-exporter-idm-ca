#!/bin/sh

mkdir /etc/blackbox_exporter/

rm -f /etc/blackbox_exporter/config.yml || :
envsubst < config.yml > /etc/blackbox_exporter/config.yml

rm -f /etc/blackbox_exporter/config_web.yml || :
envsubst < config_web.yml > /etc/blackbox_exporter/config_web.yml

/bin/blackbox_exporter --config.file=/etc/blackbox_exporter/config.yml --web.config.file=/etc/blackbox_exporter/config_web.yml