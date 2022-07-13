#!/bin/sh

rm /etc/blackbox_exporter/config_web.yml || :
envsubst < config.yml > /etc/blackbox_exporter/config.yml

rm /etc/blackbox_exporter/config_web.yml || :
envsubst < config_web.yml > /etc/blackbox_exporter/config_web.yml

/bin/blackbox_exporter --config.file=/etc/blackbox_exporter/config.yml --web.config.file=/etc/blackbox_exporter/config_web.yml