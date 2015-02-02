#!/bin/bash

sed -i -e "s/INFLUXDB_HOST/${INFLUXDB_HOST}/g" ./config.js
sed -i -e "s/INFLUXDB_PORT/${INFLUXDB_PORT}/g" ./config.js
sed -i -e "s/INFLUXDB_DB/${INFLUXDB_DB}/g" ./config.js
sed -i -e "s/INFLUXDB_USER/${INFLUXDB_USER}/g" ./config.js
sed -i -e "s/INFLUXDB_PASSWORD/${INFLUXDB_PASSWORD}/g" ./config.js
sed -i -e "s/INFLUXDB_GRAFANA_DB/${INFLUXDB_GRAFANA_DB}/g" ./config.js
