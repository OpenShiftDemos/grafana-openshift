#!/bin/bash
source /etc/sysconfig/grafana-server
cd /usr/share/grafana
/usr/sbin/grafana-server \
--config=${CONF_FILE} \
--pidfile=${PID_FILE} \
cfg:default.paths.logs=${LOG_DIR} \
cfg:default.paths.data=${DATA_DIR} \ 
cfg:default.paths.plugins=${PLUGINS_DIR}
