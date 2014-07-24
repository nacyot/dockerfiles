#!/bin/bash

[ -f /opt/grafana/src/config ] && cp /opt/grafana/src/config/config.js /opt/grafana/src/config.js

sed -i -e "s/ES_API_HOST/${ES_API_HOST}/g" ./src/config.js
sed -i -e "s/ES_API_PORT/${ES_API_PORT}/g" ./src/config.js
sed -i -e "s/GRAPHITE_API_HOST/${GRAPHITE_API_HOST}/g" ./src/config.js
sed -i -e "s/GRAPHITE_API_PORT/${GRAPHITE_API_PORT}/g" ./src/config.js
